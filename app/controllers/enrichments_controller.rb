class EnrichmentsController < ApplicationController
  def show
    enrichment = Enrichment.find(params['id'])      

    render json: EnrichmentSerializer.new(enrichment).serialized_json    
  end

  def create
    enrichment = Enrichment::Create.new(enrichment_params).execute
    render json: EnrichmentSerializer.new(enrichment).serialized_json
  end

  private

  def enrichment_params
    params.require(:lead_id)
  end
end