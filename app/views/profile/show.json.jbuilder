json.user do |json|
  json.extract! @user, :id, :name, :email, :address
end
