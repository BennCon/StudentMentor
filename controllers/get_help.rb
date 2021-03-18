get "/get-help" do
  id = params["id"]
  @mentee = Mentee[id] if Mentee.id_exists?(id)
  erb :get_help
end