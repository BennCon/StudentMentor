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
   
  def load_passw_change(params)
        self.password = params.fetch("password", "").strip
   end
   
   
  def exist?
    other_user = User.first(username: username)
    !other_user.nil? && other_user.password == password
  end
   
  def get_type
     other_user = User.first(username:username)
     return other_user.user_type
  end
   
   def self.id_exists?(id)
        return false if id.nil? # check the id is not nil
        return false if User[id].nil? # check the database has a record with this id

        true # all checks are ok - the id exists
    end 
  
    
  def self.username_exists?(username)
        return false if username.nil? # check the username is not nil
        return false if User[username].nil? # check the database has a record with this username

        true # all checks are ok - the username exists
  end
end