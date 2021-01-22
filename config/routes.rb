Rails.application.routes.draw do
  devise_for :users
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
     resources :products do
    get 'search', on: :collection
  end
  resources :categories, only: :show do
    resources :products, only: %i[index show]
  end
  root 'pages#home'
end