Rails.application.routes.draw do
  root 'pages#home'

  get '/invite/:code', to: 'invites#sign_up'
end
