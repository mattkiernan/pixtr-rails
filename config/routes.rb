Rails.application.routes.draw do

  resource :session, only: [:new, :create, :destroy]
  root("galleries#index")

  resources :users, only: [:new, :create]

  resources :galleries do
    resources :images, only: [:new, :create, :edit, :update, :show, :destroy] 
  end

  resources :images, only: [] do
    resources :comments, only: [:create, :destroy]  
  end


end
