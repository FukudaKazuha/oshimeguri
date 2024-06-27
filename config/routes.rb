Rails.application.routes.draw do
 devise_for :users
  root to: "homes#top"
  resources :users, only: [:show,:edit,:update,:destroy]
  get '/mypage' => 'users#mypage'
end
