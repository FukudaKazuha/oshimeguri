class PostsController < ApplicationController
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(post_params)
    # @post.user_id = current_user.id
    if @post.save
      redirect_to post_path(@post.id)
    else
      
      render :new
    end
  end
    
  
  def index
  end
  
  def show
     @post = Post.find(params[:id])
     @posts=Post.all
  end
  
  def edit
     @post = Post.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to post_path[:id]
  end
  
  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to 
  end
  
    # 投稿データのストロングパラメータ
  private

  def post_params
    params.require(:post).permit(:title,:body,:image)
  end
  
end
