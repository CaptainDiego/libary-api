class Enrichment::Create
  def initialize(lead_id)
    @lead = Lead.find(lead_id)
  end

  def execute
    clearbit_result = LeadEnrichmentService.new(@lead.email).fetch_clearbit_details

    Enrichment.create(lead: @lead, clearbit_result: clearbit_result)
  end
end