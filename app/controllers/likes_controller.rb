class LikesController < ApplicationController

def create

   @liked = Tweet.find(params[:id])
    @new_like = Like.new(:username => current_user.username, :Tweets_ID => @liked.id, :likes => 1)
    
    if @new_like.save
      flash[:notice] = "Now Following."
      redirect_to show_user_url(@liked.username)
    else
      flash[:error] = "Error occurred when adding friend."
      redirect_to show_user_url(@liked.username)
    end
  end
  
  def destroy
    @disliked = Like.find(params[:id])
    @follow.destroy
    flash[:notice] = "Unfollowed."
    redirect_to show_user_url(@followed)
  end

end