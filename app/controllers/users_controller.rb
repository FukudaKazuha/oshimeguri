class UsersController < ApplicationController
  before_action :set_user, only: [:show, :destroy, :favorite]
  before_action :authenticate_user!, only: [:mypage]
  before_action :authenticate_user, {only: [:top]}
  
  def new
    @user=User.new
  end
  
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
    @posts=@user.posts
  end
  
  def mypage
    @user = current_user
    redirect_to user_path(current_user)
  end
  
  def edit
    @user = User.find(params[:id])
    unless @user.id == current_user.id
      redirect_to user_path(current_user.id)
      # 遷移先はuserのshowページ
    end
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
    # ログアウト
    flash[:notice] = "ログアウトしました"
    redirect_to root_path
    # 退会
    @user = User.find(params[:id]) 
    @user.destroy
    flash[:notice] = 'ユーザーが退会しました'
  end
  
  def favorites
    @favorites = Favorites.where(user_id: @user.id).pluck(:post_id)
    @favorite_posts = Post.find(favorites)
  end
  
  
   private
   
  def user_params
    params.require(:user).permit(:profile_image, :username, :introduction)
  end

  def set_user
    @user = User.find(params[:id])
  end
  
end
