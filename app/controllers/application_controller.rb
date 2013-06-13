class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user
  
  protected


  def current_user
    @current_user ||= User.find(session[:id]) if session[:id] #|| User.find_by_username(params[:username])
  end

  





end
