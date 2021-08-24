Rails.application.routes.draw do
  get 'pharmacies/index'
  get 'pharmacies/show'
  devise_for :users
  root to: 'pages#home'
  resources :pharmacies, only: [:index, :show]
  resources :orders, only: [:index, :edit, :update] do
    resources :ordered_drugs, only: [:index]
  end
end
