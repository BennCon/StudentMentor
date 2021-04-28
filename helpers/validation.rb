module Validation
   @users = DB[:users]
   def self.email_reg?(str)
      @users.each do |user|
         if user[:email] == str
            return true
         end
      end
      false
   end
   
   def self.username_reg?(str)
      @users.each do |user|
         if user[:username] == str
            return true
         end
      end
      false
   end
end
   
         