Rails.application.routes.draw do



  root to: 'pages#home'

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' } do
  end

  resources :users, only: [:show, :index, :new, :create, :edit, :update] do
    resources :equipments
  end

  resources :equipments, only: [:show, :create, :edit, :update, :new, :delete ] do
    resources :avaibilities
  end

  resources :gears

  get "/user/equipments/new", to: "equipments#new_fake", as: "fake_new_equipment"


end
