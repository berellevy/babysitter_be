Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get "sitters", to: "public#index"
      get "sitters/:id", to: "public#show"
      post 'auth/login', to: 'authorization#login'
      get 'sitter', to: "sitters#show"
    end
  end
end
