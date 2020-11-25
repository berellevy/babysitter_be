Rails.application.routes.draw do
  
  # root to: "application#home"
  namespace :api do
    namespace :v1 do
      resources :sitters
     
    end
  end
  get "/:suffix", to: 'hello_world#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
