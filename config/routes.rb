Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :pharmacies, only: [:index, :show]

  get '/orders/:id/finish', to: 'orders#readyStatus'
  resources :orders, only: [:index, :edit, :update, :destroy, :create, :show] do
    resources :ordered_drugs, only: [:index, :edit, :update, :destroy, :create]

  end

  resources :ordered_drugs, only: [:edit, :update, :destroy]
  resources :drugs, only: [:index]
end
