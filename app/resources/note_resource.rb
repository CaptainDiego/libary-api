class NoteResource < JSONAPI::Resource
  attributes :user, :body, :created_at

  has_one :lead
end
