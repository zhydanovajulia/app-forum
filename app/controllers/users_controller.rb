class UsersController < ApplicationController
before_filter :authenticate, :only => [:index,:edit, :update]  
before_filter :correct_user, :only => [:edit, :update]

  def index
    @title = "All users"
    @users = User.paginate(:page => params[:page])
  end
  def new
    @title = "Sign up"
    @user = User.new
  end
  def show
   @user = User.find(params[:id])
   @themes = @user.themes.paginate(:page => params[:page])
   @title = @user.name
  end
  def create
   @user=User.new(params[:user])
    if @user.save
         sign_in @user
       flash[:success] = "Welcome to the Sample App!"
      redirect_to @user #user_path
    else
      @title = "Sign up"
      render 'new'
    end
  end
  def edit
    @title = "Edit user"
  end
  def update
   
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated."
      redirect_to @user
    else
      @title = "Edit user"
      render 'edit'
    end
  end
private

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end
end
