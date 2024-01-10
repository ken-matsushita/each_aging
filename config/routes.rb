Rails.application.routes.draw do
  namespace :admin do
    get 'searches/search'
  end
  namespace :admin do
    get 'users/index'
    get 'users/show'
    get 'users/edit'
  end
  namespace :admin do
    get 'genres/index'
    get 'genres/edit'
  end
  namespace :admin do
    get 'homes/top'
  end
  namespace :public do
    get 'searches/search'
  end
  namespace :public do
    get 'relationships/followings'
    get 'relationships/followers'
  end
  namespace :public do
    get 'favorites/index'
  end
  namespace :public do
    get 'post_images/new'
    get 'post_images/show'
    get 'post_images/index'
  end
  namespace :public do
    get 'users/show'
    get 'users/edit'
    get 'users/check'
  end
  namespace :public do
    get 'homes/top'
  end
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
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
