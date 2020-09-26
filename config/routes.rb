Rails.application.routes.draw do
  devise_for :users
  root to:  'home#new'
  resources :users, only: [:show, :update, :edit, :index,]
  resources :books, only: [:create,:show, :update, :edit, :index,]
  resources :home, only: [:new] do
    get :about, on: :collection
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
