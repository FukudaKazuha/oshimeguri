Rails.application.routes.draw do
 devise_for :users
  root to: "homes#top"
  get 'users/mypage' => 'users#mypage'
  resources :users, only: [:show,:edit,:update,:destroy]
 
end
