Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#top'

  post :login, controller: :session
  post :logout, controller: :session

  resources :spaces, only: [] do
    collection do
      get :search
    end
  end
  resources :users, except: [:show]
  resources :reservations
  resources :oweners, only: [:show]
  resources :clients, only: [:show]

  namespace :admin do
    resources :users, only: [:index, :update, :destroy]
    resources :spaces, only: [:index, :update, :destroy] do
      post :authorize
    end
    resources :reservations, only: [:index, :update, :destroy]
  end
end
