Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :pharmacies, only: [:index, :show]

  get '/orders/:id/finish', to: 'orders#readyStatus', as: 'ready_status'
  get '/orders/:id/pending', to: 'orders#pendingStatus', as: 'pending_status'
  get '/orders/:id/complete', to: 'orders#completeStatus', as: 'complete_status'
  resources :orders, only: [:index, :edit, :update, :destroy, :create, :show] do
    resources :ordered_drugs, only: [:index, :edit, :update, :new, :create]
  end

  resources :ordered_drugs, only: [:edit, :update, :destroy] do
    member do
      get :plus, :minus
    end
  end

  resources :drugs, only: [:index]
end
