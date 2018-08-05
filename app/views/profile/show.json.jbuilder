json.profile do |json|
  json.extract! @user, :id, :name, :email, :address, :created_at, :updated_at
end
