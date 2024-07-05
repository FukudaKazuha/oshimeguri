class UsersController < ApplicationController
  # before_action :set_user, only: [:show]
  before_action :authenticate_user!, only: [:mypage]
  # new必要？
  def new
    @user=User.new
  end
  # # create必要？
  def create
    @user = User.new(user_params[:id])
    flash[:notice] = "ログインしました"
    if @user.save
      redirect_to  users_mypage_path
    else
      render :new
    end
  end
  
  
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
    @user = User.find(params[:id])
  end
  
  def update
   @user = User.find(params[:id])
  if @user.update(user_params)
    redirect_to users_mypage_path
  else
    render :edit
  end
  end
  
  def destroy
    flash[:notice] = "ログアウトしました"
    redirect_to root_path
  end
  
  
  
   private
# 下のこれは必要ない？
  def user_params
    params.require(:user).permit(:profile_image, :username, :introduction)
  end

  def set_user
    @user = User.find([:id])
  end
  
end
