class EnrichmentSerializer
  include FastJsonapi::ObjectSerializer
  attributes :clearbit_result, :created_at
  belongs_to :lead
end
