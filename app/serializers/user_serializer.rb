class UserSerializer
  include FastJsonapi::ObjectSerializer
  
  attributes :email, :username, :password, :password_confirmation
end
