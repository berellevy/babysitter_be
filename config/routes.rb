Rails.application.routes.draw do
  
  root to: 'react#index'
  namespace :api do
    namespace :v1 do
      resources :sitters
     
    end
  end
  get "/:suffix", to: 'react#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
