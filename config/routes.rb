Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :pharmacies, only: [:index, :show]
  resources :orders, only: [:index, :edit, :update, :destroy, :create] do
    resources :ordered_drugs, only: [:index, :edit, :update, :destroy, :create]
  end
  resources :drugs, only: [:index]
end
