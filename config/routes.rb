Rails.application.routes.draw do

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  resource :review_tags, only: [:create, :destroy]
  
  devise_for :users,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  
  devise_for :admin,skip: [:passwords], controllers: {
    registrations: "admin/registrations",
    sessions: "admin/sessions"
  }
  
  devise_scope :user do
    post 'guest/guest_sign_in', to: 'guest/sessions#guest_sign_in'
  end

  scope module: :public do
    resources :reviews
    resources :accounts
    get 'users/unsubscribe' => 'accounts#unsubscribe', as: 'unsubscribe'
    patch 'users/withdrawal' => 'accounts#withdrawal', as: 'withdrawal'
    root :to =>"homes#top"
    get "about" =>"homes#about", as: 'about'
  end

  namespace :admin do
    resources :accounts, only: [:index, :show, :edit, :update, :destroy]
    resources :tags
    resources :reviews, only: [:index, :create, :show, :edit, :update]
    root :to =>"homes#top"
  end
  
end