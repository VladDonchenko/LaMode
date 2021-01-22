Rails.application.routes.draw do
  get 'orders/show'
  devise_for :users

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
     resources :products do
    get 'search', on: :collection
  end
  resources :categories, only: :show do
    resources :products, only: %i[index show]
  end
resources :products do
    resources :order_items, only: %i[create update destroy] do
      member do
        get 'add_quantity'
        get 'remove_quantity'
      end
    end
end
    resources :orders, only: :show
  root 'pages#home'
end