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

  scope module: :public do
    resources :accounts
    patch 'users/withdrawal' => 'users#withdrawal', as: 'withdrawal'
    resources :reviews, only: [:index, :create, :show, :edit, :update]
    root :to =>"homes#top"
    get "about" =>"homes#about", as: 'about'
  end

  namespace :admin do
    resources :accounts, only: [:index, :show, :edit, :update]
    resources :tags, only: [:index, :new, :create, :show, :edit, :update]
    resources :reviews, only: [:index, :create, :show, :edit, :update]
    root :to =>"homes#top"
  end
  
end