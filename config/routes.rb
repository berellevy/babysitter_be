Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth', skip: [:omniauth_callbacks]
  post 'auth/request', to:'authorization#get_authorization'
  root to: "application#home"
  namespace :api do
    namespace :v1 do
      resources :sitters
      post 'auth/request', to:'authorization#create_user_from_auth'
      post 'auth/login', to: 'authorization#login'
      mount_devise_token_auth_for 'User', at: 'auth', skip: [:omniauth_callbacks]
     
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
