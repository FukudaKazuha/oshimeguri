class Users::RegistrationssController < Devise::SessionsController
 efore_action :ensure_guest_user, only: :edit
 
 def ensure_guest_user
  if resource.email == "guest@example.com"
    redirect_to user_path(@user.id), notice: 'ゲストユーザーはプロフィール編集ページには遷移できません'
  end
 end
end