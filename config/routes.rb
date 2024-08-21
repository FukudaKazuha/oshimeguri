Rails.application.routes.draw do
  get 'searches/searche'
 devise_for :users
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end
  root to: "homes#top"
  get 'users/mypage' => 'users#mypage'
  
  resources :users, only: [:show,:edit,:update,:destroy] do
   delete :destroy, on: :member
  end

  resources :posts
  
end
