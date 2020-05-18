class LeadResource < JSONAPI::Resource
  attributes :first, :last, :email
  filters :query

  def self.apply_filter(record, filter, value, options)
    case filter
      when :query
        records.where('last LIKE ?', "%#{value.first}%")
          .or(records.where('first LIKE ?', "%#{value.first}%"))
          .or(records.where('email LIKE ?', "%#{value.first}%"))
      else
        super
    end
  end
end