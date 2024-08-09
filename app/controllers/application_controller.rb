class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  # ログインしているかどうか判断
  before_action :require_login, except: [:top]
  
  def set_current_user
    @current_user=User.find_by(id :session[:user_id])
  end

  
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
    # サインイン、ユーザーネームとパスワード
      devise_parameter_sanitizer.permit(:sign_in,keys:[:username,:password])
      # devise_parameter_sanitizer.permit(:account_update,keys:[:name,:email])
    end
  end
  
 
  private
  
  def require_login
   if !current_user && (controller_name != 'sessions' && controller_name != 'registrations')
    redirect_to root_path, alert: "ログインが必要です"
   end
  end

end
