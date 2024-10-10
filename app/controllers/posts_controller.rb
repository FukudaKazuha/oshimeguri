class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      flash[:notice] = "投稿に成功しました"
      redirect_to post_path(@post.id)
    else
      render :new
    end
  end
    
  
  def index
    @posts=Post.all
  end
  
  def show
     @post = Post.find(params[:id])
     @user = @post.user
     @post_comment = PostComment.new
  end
  
  def edit
  end
  
  def update
    if @post.update(post_params)
      flash[:notice] = "更新に成功しました"
      redirect_to post_path(@post)
    else
      flash.now[:alert] = "更新に失敗しました"
      render :edit
    end
  end
  
  def destroy
    @post.destroy
    flash[:notice] = "投稿を削除しました"
    redirect_to users_mypage_path(@post)
  end
  
    # 投稿データのストロングパラメータ
  private

  def post_params
    params.require(:post).permit(:title,:body,:image,:address)
  end
  
  def correct_user
    @post = current_user.posts.find_by(id: params[:id])
    redirect_to post_path(params[:id]) unless @post
  end
  
  
end
