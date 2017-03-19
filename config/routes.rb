Rails.application.routes.draw do

  get 'notifications/index'

  get 'relationships/create'

  get 'relationships/destroy'


  resources :relationships, only: [:create, :destroy]
  get 'comments/create'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: {
    registrations: "users/registrations",
    omniauth_callbacks: "users/omniauth_callbacks"
  }

  resources :contacts, only: [:new, :create] do
    collection do
      post :confirm
    end
  end

  resources :blogs do
    resources :comments

    collection do
      post :confirm
    end
  end
  root 'top#index'


  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  resources :poems, only: [:index, :show]
  #フォロワーの設定
  resources :users, only: [:index, :show]


  resources :conversations do
    resources :messages
  end

end
