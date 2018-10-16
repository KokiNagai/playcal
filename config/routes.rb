Rails.application.routes.draw do

  get 'notifications/link_through'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'normals#home'
  devise_for :users

  get 'rooms/show'

  get '/find', to: 'normals#find'
  post '/find', to: 'normals#find'
  get '/search', to: 'normals#search'
  get '/about', to: 'normals#about'
  get '/setting', to: 'normals#setting'
  get '/mail_confirm', to: "normals#after_mail"

  get '/inquiry/confirm', to: "contacts#inquiry"

  get 'notifications/:id/link_through', to: 'notifications#link_through', as: :link_through


  get '/posting', to: 'posts#posting'
  get '/posts/:id/post_end', to: 'posts#post_end'

  get '/inbox', to: 'normals#inbox'
  get '/outbox', to: 'normals#outbox'

  post "/likes/:post_id/create", to: 'likes#create'
  post "/likes/:post_id/destroy", to: 'likes#destroy'

  post "/reports", to: "report#create"


  resources :users, param: :name, only: [:show] do
    member do
      get :likes
    end
  end

  resources :comments
  resources :reports
  resources :posts, only: [:create, :destroy, :show]
  resources :rooms, only: [:create, :destroy, :show, :inbox]
  resource :contacts, only: [:new, :create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
