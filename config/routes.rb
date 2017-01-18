Rails.application.routes.draw do
  resources :tasks
  resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'rebalance', to: :rebalance, controller: 'dashboard'
  get 'clear', to: :clear, controller: 'dashboard'
  root to: "dashboard#index"
end
