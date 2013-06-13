class FollowsController < ApplicationController

def create

	#@follow = Follow.new(:username => username, :iFollow => other_user.username)

  @followed = User.find(params[:id])
  @relationship = current_user.follow!(@followed)
    
    if @relationship.save
      flash[:notice] = "Now Following."
      redirect_to show_user_url(@followed)
    else
      flash[:error] = "Error occurred when adding friend."
      redirect_to show_user_url(@followed)
    end
  end
  
  def destroy
    @former = User.find(params[:id])
    current_user.unfollow!(@former)

    redirect_to @former, notice: 'Unfollowed.'
      
  end




end