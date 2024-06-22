class HomesController < ApplicationController
  def top
    @user=User.new
    # (user_params[:id])
  end
  
  # def user_params
  #   params.require(:user).permit(:email, :password)
  # end
end
