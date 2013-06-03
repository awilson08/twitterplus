class User < ActiveRecord::Base
  set_table_name "Users"
  set_primary_key :username

  #@followingcount = Follow.find(:all, :select => "iFollow", :conditions => ['username = ?', :username])
  #@followers = Follow.find(:all, :select => "username", :conditions => ['iFollow = ?', :username])
end
