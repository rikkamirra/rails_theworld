Rails.application.routes.draw do
  resources :projects do
    resources :categories do
      resources :categories
      resources :articles
    end
  end

  devise_for :users
  get 'persons/profile'

  root :to => "home#index"

  #get 'persons/profile', as: 'user_root'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
