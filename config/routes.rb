Rails.application.routes.draw do

  resource :session, only: [:new, :create, :destroy]
  root("galleries#index")

  resources :users, only: [:new, :create, :show]

  resources :galleries do
    resources :images, only: [:new, :create, :edit, :update, :show] 
  end

  resources :images, only: [] do
    resources :comments, only: [:create, :show]  
    resource :like, only: [:create, :show, :destroy]
  end

  resources :groups, only: [:new, :create, :show, :index] do
    resources :group_memberships, only: [:create, :destroy]
  end



end
