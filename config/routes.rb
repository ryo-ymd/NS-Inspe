Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#top'

  get :sign_up, to: 'users#new'
  get :login, to: 'sessions#new'
  post :login, to: 'sessions#create'
  delete :logout, to: 'sessions#destroy'

  resources :spaces do
    collection do
      get :search
    end
    member do
      get :reservations
    end
    member do
      post :toggle_visible
    end
  end
  resources :users, except: [:index] do
    member do
      get :spaces
      get :reservations
    end
  end
  resources :reservations, only: [:new, :create, :show, :destroy]
  resources :owners, only: [:index]
  resources :clients, only: [:index]

  namespace :admin do
    get :top, to: 'pages#top'
    resources :users, only: [:index, :update, :destroy]
    resources :spaces, only: [:index, :update, :destroy] do
      member do
        post :authorize
        post :drop
      end
    end
    resources :reservations, only: [:index, :update, :destroy]
  end
end
