Rails.application.routes.draw do

  # Admin Routes
  resources :users,       path: '/admin/users'
  resources :courses,     path: '/admin/courses'
  resources :enrollments, path: '/admin/enrollments'

  get '/courses/details/:id', to: 'courses#details', as: 'details_course'

  # POST Enrollment
  match '/enrollments/add', to: 'enrollments#add', via: [:post]

  # remove enrollment
  get '/enrollments/remove/:id', to: 'enrollments#remove'
  get '/enrollments/group/remove/:id', to: 'enrollments#group_remove'

  # Group Routes
  get '/join_group/:course_id/:id', to: 'group#join'
  get '/group_page/:id', to: 'group#group_page'
  get '/findagroup/:id', to: 'group#findagroup'
  get '/addagroup',      to: 'group#addagroup'
  get '/add_courses',    to: 'group#enroll'
  get '/courses',        to: 'group#courses'
  get '/groups',         to: 'group#groups'

  # POST Group
  match '/addagroup/create', to: 'group#create', via: [:post]

  # Index of application
  get '/', to: 'home#index', as: 'root_url'

  # User Routes
  resources :users do
      member do
          post 'changeProfile'
      end
  end
  get 'usrs/:id/edit', to: 'users#edit', as: 'update_user'
  patch 'users/:id', to: 'users#update'
  get 'register' => 'users#new', :as => 'register'

  # Session routes
  resources :sessions, :only => [:create]
  get '/sessions/new', to: 'sessions#new', as: 'new_session'
  get 'login' => 'sessions#new', :as => 'login'
  get 'logout' => 'sessions#destroy', :as => 'logout'

  # Admin routes
  get '/admin', to: 'admin#index'

  #About page route
  get 'about', to: 'static_pages#about', :as => 'about'

end
