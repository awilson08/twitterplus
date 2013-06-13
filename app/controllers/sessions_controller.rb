class SessionsController < ApplicationController
  def new
  end

  def create
  	@user = User.find_by_emailaddress(params[:emailaddress])
    
    if @user.present? && @user.authenticate(params[:password])
      session[:id] = @user.id
      #puts "user_id: #{:user_id}, :id: puts #{:id}, current_user: #{current_user}, session: #{session[:user_id]}"
      
      redirect_to current_user, notice: 'Signed in successfully.'
    else
      redirect_to signin_path, notice: 'Password and/or Email Address was not correct. User was not signed in.'
    end
  end

  def destroy
  	reset_session
    redirect_to home_url, notice: 'Signed out successfully.'
  end
end
