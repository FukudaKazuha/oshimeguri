class Admin::UsersController < ApplicationController
skip_before_action :require_login
before_action :authenticate_admin!
    
 def index
   @users=User.all
   
 end
  
 def show
   @user = User.find(params[:id])
   @posts=@user.posts
 end
  
 def destroy
   @user = User.find(params[:id]) 
   @user.destroy
   redirect_to  admin_users_path
 end
 
    private
   
  def user_params
    params.require(:user).permit(:profile_image, :username, :introduction)
  end
  
end
