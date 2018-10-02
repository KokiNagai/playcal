Rails.application.routes.draw do

  get 'rooms/show'

  root 'normals#home'

  get '/find', to: 'normals#find'
  post '/find', to: 'normals#find'
  get '/about', to: 'normals#about'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  get '/signup', to: 'users#new'
  get  "users/:id/edit" => "users#edit"
  post "users/:id/update" => "users#update"
  post '/signup', to: 'users#create'

  get '/posting', to: 'posts#posting'

  resources :users, only: [:show, :inbox, :outbox, :new, :create, :destroy, :edit] do
    member do
      get 'outbox'
      get 'inbox'
    end
  end
  resources :prefs
  resources :comments
  resources :posts, only: [:create, :destroy, :show]
  resources :rooms, only: [:create, :destroy, :show, :inbox]

  post "prefs/:id", to: 'prefs#show'
  get '/search', to: 'normals#search'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
