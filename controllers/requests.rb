get "/requests" do
  id = params["id"]
  @mentee = Mentee[id] if Mentee.id_exists?(id)
  erb :requests
end