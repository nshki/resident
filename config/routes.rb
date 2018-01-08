Rails.application.routes.draw do
  root 'pages#home'

  get '/invite/:code', to: 'invites#sign_up'
  post '/invite/create', to: 'invites#create_account', as: :create_account

  resources :issues
end
