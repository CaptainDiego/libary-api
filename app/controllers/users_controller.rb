class UsersController < ApplicationController
  include ActionController::HttpAuthentication::Token::ControllerMethods

  before_action :authenticate, only: :show_current

  def show_current
    render json: UserSerializer.new(@current_user).serialized_json
  end

  def create
    user = User.create(user_params)

    render json: UserSerializer.new(user).serialized_json
  end

  private

  def user_params
    params.require(:data)
          .require(:attributes)
          .permit(:email, :username, :password, :password_confirmation)
  end
end
