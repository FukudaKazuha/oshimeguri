class UsersController < ApplicationController
  
  def new
    @user=User.new
  end
  
  # def create
    
  # end
  
  def edit
  end
  
  def show
  end
  
  def update
  end
  
  def destroy
  end
  
  # mypageはnamespace使う
  
   private

  def user_params
    params.require(:user).permit(:email, :password)
  end
  
end
