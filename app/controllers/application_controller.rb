class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  def after_sign_in_path_for(resource)
    mypage_path(current_user)
    
  end
  
  def after_sign_out_path_for(resource)
    root_path
  end
  
   protected

  def configure_permitted_parameters
     if resource_class == User
    # サインアップ、マールとパスワード追加
       devise_parameter_sanitizer.permit(:sign_up, keys: [:username,:email,:password])
    # サインイン、
       devise_parameter_sanitizer.permit(:sign_in,keys:[:username,:password])
      # devise_parameter_sanitizer.permit(:account_update,keys:[:name,:email])
     end
  end
  

end
