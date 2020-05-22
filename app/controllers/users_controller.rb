class UsersController < ApplicationController
  include ActionController::HttpAuthentication::Token::ControllerMethods

  before_action :authenticate, only: :show_current

  def show_current

  end
end
