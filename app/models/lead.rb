class Lead < ApplicationRecord
  has_many :notes
  has_many :enrichments
end
