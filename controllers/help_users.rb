get "/help-users" do
  redirect "/" unless session[:logged_in]
  id = session[:id]
  @admin = Admin[id] if Admin.id_exists?(id)
  @user = User[id]
    
  @faqs = Questions_answers.all
    
  erb :help_users
end

post "/help-users" do
   id = session[:id]
   faq = Questions_answers.new

   #Loads the q&a
   faq.load(params)
   faq.save_changes
   redirect "/help-users"
   erb :help_users
end