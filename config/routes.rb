Rails.application.routes.draw do

  # Index of application
  get '/', to: 'home#index', as: 'root_url'

  # User Routes
  resources :users
  get 'register' => 'users#new', :as => 'register'

  # Session routes
  resources :sessions, :only => [:create]
  get '/sessions/new', to: 'sessions#new', as: 'new_session'
  get 'login' => 'sessions#new', :as => 'login'
  get 'logout' => 'sessions#destroy', :as => 'logout'


end
