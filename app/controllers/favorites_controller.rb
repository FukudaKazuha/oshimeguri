class FavoritesController < ApplicationController
  before_action :set_user_and_post
  
  def create
    post = Post.find(params[:post_id])
    favorite = current_user.favorites.new(post_id: post.id)
    favorite.save
    redirect_to post_path(post)
  end
 
 
   def index
    @posts = current_user.favorites
   end

 
  def destroy
    post = Post.find(params[:post_id])
    favorite = current_user.favorites.find_by(post_id: post.id)
    favorite.destroy
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