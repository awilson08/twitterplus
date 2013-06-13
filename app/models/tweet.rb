class Tweet < ActiveRecord::Base
 	set_table_name "Tweets"

 	attr_accessible :id, :username, :text, :timeStamp, :privacySetting

 	validates :text, :length => 1...140, :presence =>true, :on => :create
 	validates :username, :presence =>true, :on => :create

 	before_create :check_retweet

 	private

 	def check_retweet
 		if self.text.include?('RT @')
 			self.retweet = true  
 			self. privacySetting = false
 			return true
 		else
 			self.retweet = false
 			return true
 		end
 	end
  	
end
