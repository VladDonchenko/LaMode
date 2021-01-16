Rails.application.routes.draw do
     resources :products do
    get 'search', on: :collection
  end
  resources :categories, only: :show do
    resources :products, only: %i[index show]
  end
  root 'pages#home'
end