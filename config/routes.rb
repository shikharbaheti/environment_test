Rails.application.routes.draw do
  resources :books
  root 'books#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :books do
    member do
      get :delete
    end
  end

end