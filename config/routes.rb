Rails.application.routes.draw do
  resources :products
  resources :categories, only: :show do
    resources :products, only: %i[index show]
  end
  root 'pages#home'
end