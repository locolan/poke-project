class UsersController < ApplicationController
  def index
    @pokemon = Pokemon.all
    @users = User.all
    @user = User.new
  end
  
  def new
     @user = User.new
  end
  
  def signup
    @pokemon = Pokemon.all
    @users = User.all
    @user = User.new
    redirect_to(:root)
  end

  def create
     @user = User.new(params[:user])
    
     if @user.save
       session[:user_id] = @user.id # <- This is all "auto-login" is. Ha.
      
       redirect_to(:root)

     else
       render "signup"
     end
  end
  
  def show
    @teams = Team.all
    @user = User.find(session[:user_id])
    if params[:id].to_s == session[:user_id].to_s
    else
      redirect_to profile_url params[:id].to_i
    end
    
    
  end

  def update
    redirect_to(user_url(current_user.id))
  end

  def edit
    @user = User.find(session[:user_id])
  end

  def destroy
    redirect_to(:root)
  end
end
