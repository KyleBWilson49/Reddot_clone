Rails.application.routes.draw do
  resource :user, only: [:new, :create, :show, :update]
  resource :session, only: [:new, :create, :destroy]
  resources :subs do
    resources :posts, only: [:new, :create, :show]
  end
  resources :posts, only: [:edit, :update, :destroy]
end
