Rails.application.routes.draw do

  get 'notifications/link_through'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'normals#home'
  devise_for :users

  get 'rooms/show'

  get '/find', to: 'normals#find'
  post '/find', to: 'normals#find'
  get '/about', to: 'normals#about'
  get '/setting', to: 'normals#setting'
  get '/mail_confirm', to: "normals#after_mail"

  get '/inquiry/confirm', to: "contacts#inquiry"

  get 'notifications/:id/link_through', to: 'notifications#link_through', as: :link_through


  get '/posting', to: 'posts#posting'


  get '/inbox', to: 'normals#inbox'
  get '/outbox', to: 'normals#outbox'


  resources :users, param: :name, only: [:show]
  resources :prefs
  resources :comments
  resources :posts, only: [:create, :destroy, :show]
  resources :rooms, only: [:create, :destroy, :show, :inbox]
  resource :contacts, only: [:new, :create]


  post "prefs/:id", to: 'prefs#show'
  get '/search', to: 'normals#search'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
