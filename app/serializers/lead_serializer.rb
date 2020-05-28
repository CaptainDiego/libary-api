class LeadSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :first, :last, :email, :created_at 
end
