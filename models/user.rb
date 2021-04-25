class User < Sequel::Model
  def load(params)
    self.first_name = params.fetch("first_name", "").strip
    self.surname = params.fetch("surname", "").strip
    self.username = params.fetch("username", "").strip
    self.email = params.fetch("email", "").strip
    self.password = params.fetch("password", "").strip
    self.user_type = params.fetch("user_type","").strip
  end
   
  #Different param set for editing after sign-up
  def load_edit(params)
     self.first_name = params.fetch("first_name", "").strip
     self.surname = params.fetch("surname", "").strip
     self.username = params.fetch("username", "").strip
     self.email = params.fetch("email", "").strip
  end
   
   
  def exist?
    other_user = User.first(username: username)
    !other_user.nil? && other_user.password == password
  end
   
  def get_type
     other_user = User.first(username:username)
     return other_user.user_type
  end
end