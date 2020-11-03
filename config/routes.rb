Rails.application.routes.draw do
  root to: "application#home"
  namespace :api do
    namespace :v1 do
      resources :sitters
     
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
