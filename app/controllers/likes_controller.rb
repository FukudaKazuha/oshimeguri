class LikesController < ApplicationController
  before_action :set_user_and_post 
  
  def create
   post = Post.find(params[:post_id])
   like = current_user.likes.new(post_id: post.id)
   # @post = Post.find(post_params[:id])
   # @user = User.find(params[:id])
   @post_like.save
   redirect_to post_path(post)
  end
  
  
  def index
   @posts=current_user.like_posts
  end

  def destroy
   like = Like.find_by(user_id: @user.id, post_id: @post.id)
   like.destroy
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
