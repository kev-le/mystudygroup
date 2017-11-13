Rails.application.routes.draw do

  # Admin Routes
  resources :users,       path: '/admin/users'
  resources :courses,     path: '/admin/courses'
  resources :enrollments, path: '/admin/enrollments'

  get '/courses/details/:id', to: 'courses#details', as: 'details_course'

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

  # Admin routes
  get '/admin', to: 'admin#index'


end
