Rails.application.routes.draw do
 
 
 devise_for  :admins, path: :admin, skip: [:registrations, :password], controllers: {
  sessions: 'admin/sessions'
 }
  get '/admins/sign_out' => 'devise/admins/sessions#destroy'
 
 
 namespace :admin do
  resources :users, only: [:index,:show,:destroy]
 end
  
 devise_for :users
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  
  root to: "homes#top"
  get 'users/mypage' => 'users#mypage'
  
  resources :users, only: [:index,:show,:edit,:update,:destroy] do
   delete :destroy, on: :member
   resources :favorites, only: [:index]
  end

  
  get "search" => "searches#search"
  
  
  resources :posts do
    resource :favorite, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
    resource :map, only: [:show]
  end
  
  
  # resources :likes, only: [:index,:create,:destroy] 
end