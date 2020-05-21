class UserResource < JSONAPI::Resource
  attributes :email, :username, :password, :password_confirmation
end
