class LikesController < ApplicationController
  before_action :set_user_and_post 
  
  def create
   @post = Post.find(post_params[:id])
   # @user = User.find(params[:id])
   Like.create
   redirect_to post_path(@post.id)
  end
  
  def index
   @posts=current_user.like_posts
  end

  def destroy
   like = Like.find_by(user_id: @user.id, post_id: @post.id)
   like.delete
   redirect_to post_path(@post)
  end
  
  private
  
  def set_user_and_post
   @user = current_user
  # @post = Post.find(params[:id])
  end
  
  def post_params
    params.require(:post).permit(:title,:body,:image)
  end
  
  
end
