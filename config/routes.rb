Rails.application.routes.draw do
 
 
 devise_for  :admins, path: :admin, skip: [:registrations, :password], controllers: {
  sessions: 'admin/sessions'
 }
 
 namespace :admin do
  resources :users, only: [:index,:show,:destroy]
 end
  
 devise_for :users
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end
  
  root to: "homes#top"
  get 'users/mypage' => 'users#mypage'
  
  resources :users, only: [:show,:edit,:update,:destroy] do
   delete :destroy, on: :member
  end

  
  get "search" => "searches#search"
  
  resources :posts do
    resources :post_comments, only: [:create, :destroy]
    resource :map, only: [:show]
  end
end
