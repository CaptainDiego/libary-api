class StatusController < ApplicationController
  def index
  	render json: {status: "diego"}
  end
end 