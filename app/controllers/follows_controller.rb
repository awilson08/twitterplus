class FollowsController < ApplicationController

def create

	#@follow = Follow.new(:username => username, :iFollow => other_user.username)

  @followed = User.find(params[:id])
  @relationship = current_user.follow!(@followed)
    
    
      if @relationship.save
        redirect_to @followed, notice: 'Now following'
      else
         redirect_to @followed, notice: 'Not able to follow at this time'
      end
  end
  
  def destroy
    @former = User.find(params[:id])
    @destroy = current_user.unfollow!(@former)

    respond_to do |format|
      format.html {redirect_to @former, notice: 'Unfollowed.'}
    end
  end




end