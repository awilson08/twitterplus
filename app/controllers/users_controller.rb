class UsersController < ApplicationController

protect_from_forgery :except => :checkuser

  def index
    #get - display a list of all users (random with limit)
    @users = User.order("RAND(username)").limit(50)
  end

  def new
    #get - html form to create a new user. link to this on welcome page
    @user = User.new
  end


  def create
    #post - create a new user (add to database)
    @user = User.new(params[:user])

      respond_to do |format|
      if @user.save
        session[:id] = @user.id
        UserMailer.new_user_email(@user).deliver
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    #get - return HTLM form for profile?
    @user = User.find_by_username(params[:id])
  end

  def update
    #put - update user
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end

  end

  def destroy
    # delete - delete a user (remove from database)
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end

  end
  

  def show
    # get - show profile of user
    #puts "current_user: #{current_user}, puts session[:id]: #{session[:id]}"
    @tweet = Tweet.new
    
  	begin 
      @user = User.find(params[:id]) 
    rescue ActiveRecord::RecordNotFound 
      @user = User.find_by_username(params[:username])
    end

  	@tweets = Tweet.find_all_by_username(@user.username)
    @following = Follow.find(:all, :select => "iFollow", :conditions => ['username = ?', @user.username ])
  	@followers = Follow.find(:all, :select => "username", :conditions => ['iFollow = ?', @user.username ])

    @followingcount = @following.count
    @followerscount = @followers.count

  	@lists = []

    listIDs = ListUser.find(:all, :select => "Lists_listID", :conditions =>['Users_username =?', @user.username])
    @collectionIDs = Collection.find(:all, :select => "name", :conditions =>['username =?', @user.username])
    
    listIDs.each do |l|
        @lists << List.find(l.Lists_listID)
        #timeline
    end

    



end

  def timeline
    #timeline is a collection of tweets of those you follow, along with your tweets, ordered by the datetime
    @timeline = []
    @following = Follow.find(:all, :select => "iFollow", :conditions => ['username = ?', params[:username] ])
    @tweets = Tweet.find_all_by_username(params[:username])

    @tweets.each do |tweet|
      @timeline << tweet
    end

    @following.each do |user|
        local = Tweet.find_all_by_username(user)
          local.each do |tweet|
            @timeline << tweet
          end
    end

  end

  # def checkuser
  #   @user = User.find_by_username(params[:username])
  #   if @user
  #     render :text => true, :layout => false
  #   elsif params[:username].blank?
  #     render :text => true, :layout => false
  #   else
  #     render :text => false, :layout => false
  #   end
  # end

  # @following = Follow.find(:all, :select => "iFollow", :conditions => ['username = ?', @user.username ])
  # @followers = Follow.find(:all, :select => "username", :conditions => ['iFollow = ?', @user.username ])


  


end
