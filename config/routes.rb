Rails.application.routes.draw do
  devise_for :users
  root 'groups#index'
  resources :users, only: [:edit, :update]
  resources :groups, only: [:index, :new, :create, :edit, :update] do
    #メッセージのルーティングはグループにネストした形になっている
    #メッセージの保存を行う:create
    resources :messages, only: [:index, :create]
  end
end
