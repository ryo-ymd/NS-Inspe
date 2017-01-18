Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#top'

  get :sign_up, to: 'users#new'
  get :login, to: 'sessions#new'
  post :login, to: 'sessions#create'
  delete :logout, to: 'sessions#destroy'

  resources :spaces, only: [:index] do
    collection do
      get :search
      get :reserve
    end
  end
  resources :users, except: [:index]
  resources :reservations, only: [:new, :create, :show, :destroy]
  resources :owners, only: [:show]
  resources :clients, only: [:show]

  namespace :admin do
    resources :users, only: [:index, :update, :destroy]
    resources :spaces, only: [:index, :update, :destroy] do
      post :authorize
    end
    resources :reservations, only: [:index, :update, :destroy]
  end
end
