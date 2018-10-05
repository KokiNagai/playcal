Rails.application.routes.draw do
  root 'normals#home'
  devise_for :users


  get 'rooms/show'

  get '/find', to: 'normals#find'
  post '/find', to: 'normals#find'
  get '/about', to: 'normals#about'

  get '/posting', to: 'posts#posting'


  resources :users, only: [:show, :inbox, :outbox] do
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
