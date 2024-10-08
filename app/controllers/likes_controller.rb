class LikesController < ApplicationController
  before_action :set_user_and_post 
  
  def create
   post = Post.find(params[:post_id])
   like = current_user.likes.new(post_id: post.id)
   like.save
   redirect_to post_path(post)
  end
  
  
  def index
   @posts=current_user.like_posts
  end
  

  def destroy
   post = Post.find(params[:post_id])
   like = current_user.likes.find_by(post_id: post.id)
   like.destroy
   redirect_to post_path(post)
  end
  
  private
  
  def set_user_and_post
   @user = current_user
  end
  
  def post_params
    params.require(:post).permit(:title,:body,:image)
  end
  
  
end
