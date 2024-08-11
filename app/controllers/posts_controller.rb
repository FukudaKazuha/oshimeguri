class PostsController < ApplicationController
  # before_action :authenticate_user
  
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
     @posts=current_user.posts
     @user=@post.user
     
  end
  
  def edit
    @post = Post.find(params[:id])  
    post = Post.find(params[:id])
    unless post.user.id == current_user.id
    redirect_to edit_post_path
    end
  end
  
  def update
    @post = Post.find(params[:id])
   if @post.update(post_params)
      flash[:notice] = "更新に成功しました"
    redirect_to post_path(@post.id)
   else
     render :edit
   end
  end
  
  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to users_mypage_path(@post)
  end
  
    # 投稿データのストロングパラメータ
  private

  def post_params
    params.require(:post).permit(:title,:body,:image)
  end
  
end
