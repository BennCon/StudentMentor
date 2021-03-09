get "/admin-form" do
   @admin = Admin.new
   erb :admin_form
end

post "/admin-form" do
   @admin = Admin.new
   @admin.load(params)
   @admin.save_changes
   redirect "/admin_form"
   erb :admin_form
end