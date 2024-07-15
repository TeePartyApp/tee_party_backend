json.id match.id
json.user_id match.user_id
json.matched_user_id match.matched_user_id
json.status match.status
json.matched_user do
  matched_user = User.find(match.matched_user_id)
  json.name matched_user.name
  json.image_url matched_user.image_url
  json.email matched_user.email
end