class LeadSerializer
  include FastJsonapi::ObjectSerializer
  attributes :first, :last, :email, :created_at 
end
