class User < ActiveRecord::Base
  set_table_name "Users"
  set_primary_key :username
  has_secure_password
  attr_accessible :name, :emailaddress, :password, :username, :password_confirmation, :biography

  
  validates :emailaddress, uniqueness: true, presence: true, :format => /@/
  validates :username, uniqueness: true, presence: true, :length => { :maximum => 25 } 
  validates :name, :length => 5...30
  validates :password, :length => 5...20, :presence =>true, :on => :create
  validates :username, :format => {:with => /^@/,  :message => "Please use put your username in the form: @username"}

  before_save {emailaddress.downcase! }
  


    def following?(other_user)
        return not(Follow.find(:all, :select => "iFollow", 
          :conditions => ["username = #{username}  and iFollow = #{other_user.username}"]).nil?)
    end

    def follow!(other_user)
      if (following?(other_user) == false)
        Follow.new(:username => username, :iFollow => other_user.username)
      end
    end

    def unfollow!(other_user)
      @follow = Follow.find(username, other_user.username)
      

      #@follow.destroy_all
      
      # Follow.find_by_sql("SELECT *
      #                     FROM Follows 
      #                     WHERE Follows.username = #{username} 
      #                     AND Follows.iFollow = #{other_user.username}")

    end



end
