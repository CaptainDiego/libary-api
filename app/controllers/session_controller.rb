require 'jwt'

class SessionController < ApplicationController
  TWO_HOURS = 2 * 3600

  def create
    user = User.find_by!(email: params['email'])
    raise if BCrypt::Password.new(user.password_digest) != params['password']

    render json: { token: encrypt_user_data(user) }
  rescue
    render status: :unauthorized, json: { errors: [unauthorized_error_details] }
  end

  private

  def encrypt_user_data(user)
    user_data = { id: user.id, username: user.username, email: user.email }
    payload = {
      data: user_data,
      subscriber: user.id,
      expiration: Time.now + TWO_HOURS
    }

    JWT.encode(payload, JWT_SECRET, 'HS512')
  end

  def unauthorized_error_details
    {
      status: 401,
      title: 'unauthorized',
      detail: 'Error logging in'
    }
  end
end
