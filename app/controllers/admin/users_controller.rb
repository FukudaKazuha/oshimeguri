class Admin::UsersController < ApplicationController
    
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
