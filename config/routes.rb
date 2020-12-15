Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get "sitters", to: "public#index"
      get "sitters/:id", to: "public#show"
      post 'auth/login', to: 'authorization#login'
      get 'sitter', to: "sitters#show"
      post 'appointments', to: "sitters#new_appointment"
      get "appointments", to: "sitters#appointments"
      patch "update_sitter", to: "sitters#update_sitter"
      get "references", to: "sitters#references"
      post "references", to: "sitters#add_reference"
    end
  end
end
