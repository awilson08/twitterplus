class TweetsController < ApplicationController

  def index
    #public timeline
    @publictimeline = Tweet.find(:all, :order => "timeStamp DESC", :limit => 50)
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(params[:tweet])

      respond_to do |format|
      if @tweet.save
        
        format.html { redirect_to current_user, notice: 'Tweet was successfully created.' }
        format.json { render json: current_user, status: :created, location: @tweet }
      else
        format.html { redirect_to current_user, notice: @tweet.errors}
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @tweet = Tweet.find(params[:id])
  end

  def destroy
    @tweet = Tweet.find(params[:id])
    @tweet.destroy

    respond_to do |format|
      format.html { redirect_to current_user }
      format.json { head :no_content }
    end
  end

  def mostpop
      @mostliked = Like.sum(:likes, :group => :Tweets_ID,:order => 'sum_likes desc', :limit =>20)
      @tweets = []

      @mostliked.each do |like, score|
        @tweets << [Tweet.find(like),score]
      end
  end

  def leastpop
    @leastliked = Like.sum(:likes, :group => :Tweets_ID,:order => 'sum_likes asc', :limit =>20)
    @tweets = []

    @leastliked.each do |like, score|
      @tweets << [Tweet.find(like),score]
    end
  end

end
