class UsersController < ApplicationController
  # before_action :set_user, only: [:show]
  before_action :authenticate_user!, only: [:mypage]
  # # new必要？
  # def new
  #   @user=User.new
  # end
  # # # create必要？
  # def create
  #   @user = User.new(user_params[:id])
    
  #   if @user.save
  #     redirect_to user_path(current_user)
  #   else
  #     # @users = User.all 
  #     render :new
  #   end
  # end
  
  
  def show
    @user = User.find(params[:id])
    @posts=Post.all
    # @user = current_user
  end
  
  def mypage
    @user = current_user
    redirect_to user_path(current_user)
  end
  
  def edit
  end
  
  def update
  end
  
  def destroy
  end
  
  
  
   private
# 下のこれは必要ない？
  def user_params
    params.require(:user).permit(:email, :password, :username,:image)
  end

  def set_user
    @user = User.find([:id])
  end
  
end
