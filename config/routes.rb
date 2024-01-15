Rails.application.routes.draw do
  
  # 顧客用
  # URL /users/sign_in ...
  devise_for :users, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  
  scope module: :public do
    root to: "homes#top"
    resources :post_images, only: [:new, :create, :show, :index, :destroy] do
      resource :favorite, only: [:create, :destroy, :index]
      resources :comments, only: [:create, :destroy]
    end
    
    get "search" => "searches#search"
    get "users/check" => "users#check"
    patch "users/withdraw" => "users#withdraw"
    
    resources :users, only: [:show, :edit, :update] do
      resource :relationships, only: [:create, :destroy]
      get 'followings' => 'relationships#followings', as: 'followings'
      get 'followers' => 'relationships#followers', as: 'followers'
    end
  end
  
  namespace :admin do
    resources :genres, only: [:create, :index, :edit, :update, :destroy]
    resources :users, only: [:show, :index, :edit, :update]
    
    root to: "homes#top"
    get "search" => "searches#search"
  end
  
  devise_scope :user do
    post "users/guest_sign_in", to: "public/sessions#guest_sign_in"
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
