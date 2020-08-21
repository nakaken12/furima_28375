Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'items#index'
  resources :items do
    resources :trades, only: [:index, :create]
    collection do
      get 'search'
    end
  end
  get 'category/:id',  to: 'items#lookfor_category'
  get 'brand/:value',  to: 'item_brands#lookfor_brand'
end
