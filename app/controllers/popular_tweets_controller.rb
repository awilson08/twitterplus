class PopularTweetsController < ApplicationController
  
  def mostpop
  	@mostliked = Like.sum(:likes, :group => :Tweets_ID,:order => 'sum_likes desc', :limit =>20)
  	
  end

  def leastpop
  	@leastliked = Like.sum(:likes, :group => :Tweets_ID,:order => 'sum_likes asc', :limit =>20)

  end
end
