# ログイン画面、ログイン、ログアウト
class SessionsController < ApplicationController
  
 def new
    @user=User.new
 end  
 
 def create
    @user = User.new(user_params[:id])
    
 end
 
 def destroy
 end
end
