class TrendingController < ApplicationController
  def show
  	@trending = Hashtag.find(:all, :limit => 50)

  end
end
