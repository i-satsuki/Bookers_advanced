Rails.application.routes.draw do
  get 'home/about'
  get 'top/index'
  root to: 'top#index'

  # devise_for :users
  devise_for :users, controllers: {
    registrations: "users/registrations",
  }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :books, only:[:create, :index, :show, :edit, :update, :destroy]
  resources :users, only:[:index, :show, :edit, :update]
end
