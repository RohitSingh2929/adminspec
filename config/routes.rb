Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :hikes, only: [:index] do
    collection do
      get 'count', to: 'hikes#count'
    end
  end
  
  resources :breweries, only: [:index] do
    collection do
      get 'count', to: 'breweries#count'
    end
  end
  namespace :admin do
    resources :subcategoriess
  end  
end