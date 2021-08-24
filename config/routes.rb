Rails.application.routes.draw do
  devise_for :users
  # root to "pages#home"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :pharmacies, only: [:index, :show]
  resources :orders, only: [:index, :edit, :update, :destroy] do
    resources :ordered_drugs, only: [:index, :edit, :update, :destroy]
  end
end
