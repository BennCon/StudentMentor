get "/my-account-mentor" do
  id = params["id"]
  @mentor = Mentor[id] if Mentor.id_exists?(id)
  erb :my_account_mentor
end