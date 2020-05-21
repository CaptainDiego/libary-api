require 'jwt'

class SessionController < ApplicationController
  TWO_HOURS = 2 * 3600

  def create
    email = params["email"]
    password = params["password"]

    begin
      user = User.find_by!(email: email)

      if BCrypt::Password.new(user.password_digest) == password
        user_data = { id: user.id, username: user.username, email: user.email }
        payload = {
          data: user_data,
          subscriber: user.id,
          expiration: Time.now + TWO_HOURS
        }

        token = JWT.encode(payload, JWT_SECRET, "HS512")

        render json: { token: token }
      else
        render status: :unauthorized, json: {
          errors: [
            {
              status: 401,
              title: 'unauthorized',
              detail: 'Error logging in'
            }
          ]
        }
      end
    rescue
      render status: :unauthorized, json: {
        errors: [
          {
            status: 401,
            title: 'unauthorized',
            detail: 'Error logging in'
          }
        ]
      }
    end
  end
end
