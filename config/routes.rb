Rails.application.routes.draw do

  get 'notifications/link_through'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'normals#home'
  devise_for :users, skip: [:sessions, :registrations], controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  devise_scope :user do
  get 'login' => 'users/sessions#new', as: :new_user_session
  post 'login' => 'users/sessions#create', as: :user_session
  delete 'logout' => 'users/sessions#destroy', as: :destroy_user_session
  get 'signup' => 'users/registrations#new', as: :new_user_registration
  post 'signup' => 'users/registrations#create'
  delete 'signout' => 'users/registrations#destroy', as: :destroy_user_registration
  get 'edit' => 'users/registrations#edit', as: :edit_user_registration
  put 'edit' => 'users/registrations#update'
  get 'confirm_email', to: 'users/registrations#confirm_email'
  get 'edit_confirmation', to: 'users/registrations#edit_confirmation'
end



  get 'rooms/show'

  get '/find', to: 'normals#find'
  post '/find', to: 'normals#find'
  get '/search', to: 'normals#search'
  get '/about', to: 'normals#about'
  get '/setting', to: 'normals#setting'
  get '/mail_confirm', to: "normals#after_mail"
  get '/message', to: "normals#message"

  get '/inquiry/confirm', to: "contacts#inquiry"

  get 'notifications/:id/link_through', to: 'notifications#link_through', as: :link_through


  get '/posting', to: 'posts#posting'
  get '/posts/:id/post_end', to: 'posts#post_end'

  post "/likes/:post_id/create", to: 'likes#create'
  post "/likes/:post_id/destroy", to: 'likes#destroy'

  post   '/good/:chat_id' => 'goods#create',   as: 'good'
  delete '/good/:chat_id' => 'goods#destroy', as: 'nongood'

  post "/reports", to: "report#create"

  post "/chats", to: "chats#create"

  get "/tourlists", to: "normals#tourlist"


  resources :users, param: :name, only: [:show] do
    member do
      get :likes
    end
  end

  get "/:chatname", to: "chatboxes#chatbox"

  resources :comments
  resources :reports
  resources :posts, only: [:create, :destroy, :show]
  resources :rooms, only: [:create, :destroy, :show, :inbox]
  resource :contacts, only: [:new, :create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
