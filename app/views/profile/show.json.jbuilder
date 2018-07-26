json.profile do |json|
  json.extract! @user, :id, :name, :email, :address
end
