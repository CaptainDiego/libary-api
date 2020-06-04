class EnrichmentsController < ApplicationController
  def show
    enrichment = Enrichment.find(params['id'])      

    render json: EnrichmentSerializer.new(enrichment).serialized_json    
  end

  def create
    enrichment = Enrichment::Create.new(lead_id).execute
    render json: EnrichmentSerializer.new(enrichment).serialized_json
  end

  private

  def lead_id
    params['lead_id']
  end
end