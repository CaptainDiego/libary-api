class LeadsController < ApplicationController
  def index
    render json: LeadSerializer.new(Lead.all).serialized_json
  end

  def create
    lead = Lead.create(lead_params)
    render json: LeadSerializer.new(lead).serialized_json
  end

  def show
    lead = Lead.find(params['id'])
    render json: LeadSerializer.new(lead).serialized_json
  end

  def update
    
  end

  def destroy
    Lead.find(params['id']).destroy

    head :no_content
  end

  private


  def lead_params
    params.require(:data)
          .require(:attributes)
          .permit(:first, :last, :email)
  end
end