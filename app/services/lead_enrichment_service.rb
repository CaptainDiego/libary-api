require 'clearbit'

class LeadEnrichmentService
  def initialize(email)
    @email = email
  end

  def fetch_clearbit_details
    response = Clearbit::Enrichment.find(email: @email)
  end
end