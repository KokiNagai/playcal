Rails.application.routes.draw do

  root 'normals#home'
  devise_for :users


  get 'rooms/show'

  get '/find', to: 'normals#find'
  post '/find', to: 'normals#find'
  get '/about', to: 'normals#about'
  get '/inquiry/confirm', to: "contacts#inquiry"

  get '/posting', to: 'posts#posting'

  get "users/:id" => "users#show"
  get "users/:id/inbox" => "users#inbox"
  get "users/:id/inbox" => "usersi#outbox"




  resources :prefs
  resources :comments
  resources :posts, only: [:create, :destroy, :show]
  resources :rooms, only: [:create, :destroy, :show, :inbox]
  resource :contacts, only: [:new, :create]


  post "prefs/:id", to: 'prefs#show'
  get '/search', to: 'normals#search'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
