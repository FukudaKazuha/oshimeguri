Rails.application.routes.draw do
  devise_for :users
  root to: "homes#top"
  resources :users, only: [:show]
  get '/mypage' => 'users#mypage'
end
