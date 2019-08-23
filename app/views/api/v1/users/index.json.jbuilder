json.status :success

if @users.present?
  json.users_data @users do |user|
    json.id user.id
    json.first_name user.first_name
    json.last_name user.last_name
    json.email user.email
    json.contact user.contact
  end
else
  json.users_data []
end