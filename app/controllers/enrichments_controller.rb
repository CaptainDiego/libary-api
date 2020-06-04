class EnrichmentsController < ApplicationController
  def show
    enrichment = Enrichment.find(params['id'])      

    render json: EnrichmentSerializer.new(enrichment).serialized_json    
  end

  def create
    lead = Lead.find(params['lead_id'])

    clearbit_result = LeadEnrichmentService.new(lead.email).fetch_clearbit_details

    enrichment = Enrichment.create(lead: lead, clearbit_result: clearbit_result)

    render json: EnrichmentSerializer.new(enrichment).serialized_json
  end
end