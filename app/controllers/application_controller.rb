class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  # ログインしているかどうか判断
  before_action :authenticate_user

  
  def after_sign_in_path_for(resource)
    users_mypage_path(current_user)
    
  end
  
  def after_sign_out_path_for(resource)
    root_path
  end
  
   protected

  def configure_permitted_parameters
    if resource_class == User
    # サインアップ、メールとパスワード追加
      devise_parameter_sanitizer.permit(:sign_up, keys: [:username,:email,:password])
    # サインイン、
      devise_parameter_sanitizer.permit(:sign_in,keys:[:username,:password])
      # devise_parameter_sanitizer.permit(:account_update,keys:[:name,:email])
    end
  end
  
  def authenticate_user
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end
  

end
