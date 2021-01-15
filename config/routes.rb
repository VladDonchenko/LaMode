Rails.application.routes.draw do
	resources :categories, only: :show do
		resources :products, only: [:index, :show]
	end
  root 'pages#home'
end