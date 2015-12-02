Rails.application.routes.draw do

  root to: 'pages#home'

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' } do
  end

  resources :users, only: [:show, :index, :new, :create] do
    resources :equipments
  end

  get "/user/equipments/new", to: "equipments#new_fake", as: "fake_new_equipment"
end
