class Follow < ActiveRecord::Base


  set_table_name "Follows"
  attr_accessible :username, :iFollow

	#self.primary_keys = [:username, :iFollow]

  before_create :check_user

  private
   def check_user 
   		var1 = User.find_by_username(self.username).nil?
   		var2 = User.find_by_username(self.iFollow).nil?
   	return not(var1 && var2)
   end

end
