Rails.application.routes.draw do
  get 'hello_world', to: 'hello_world#index'
  root to: "application#home"
  namespace :api do
    namespace :v1 do
      resources :sitters
     
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
