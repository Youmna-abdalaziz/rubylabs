Rails.application.routes.draw do
  devise_for :users
  #get 'sessions/new'
  #get 'sessions/create'
  #get 'sessions/destroy'
  get 'home/index'
  get 'users/new'
  get 'welcome/index'
  #get 'signup', to:'users#new', as: 'signup'
  #get 'login', to: 'sessions#new', as: 'login'
  #get 'logout', to: 'sessions#destroy', as: 'logout'
  #resources :users
  #resources :sessions, only: [:new, :create, :destroy]
  resources :articles do
    resources :comments
  end
  #root 'welcome#index'
  root 'home#index'
end


 

