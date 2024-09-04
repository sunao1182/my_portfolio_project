Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  # get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  # ルートパスを指定
  root 'products#index'

  # 商品関連のルーティング
  resources :products, only: [:index, :show]

  # カート関連のルーティング
  resource :cart, only: [:show] do
    resources :cart_items, only: [:create, :destroy]
  end

  # 注文関連のルーティング
  resources :orders, only: [:new, :create]

  # ユーザー認証関連のルーティング
  devise_for :users

end
