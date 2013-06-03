class PublicTimelineController < ApplicationController
  def show
  	@publictimeline = Tweet.find(:all, :order => "timeStamp DESC", :limit => 50)

  	#@trending = Hashtag.find(:all, :limit => 30)
  end
end
