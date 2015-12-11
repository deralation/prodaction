Rails.application.routes.draw do
  root to: 'pages#home'

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' } do
  end

  resources :equipments

  resources :users, only: [:show, :index, :new, :create, :edit, :update, :index] do
    resources :equipments, controller: :user_equipments do
    end
  end

  resources :user_equipments

  resources :equipments, controller: :user_equipments do
  end

  resources :equipments do
    resources :reservations, only: [:create, :destroy]
  end

  resources :equipments do
    resources :reviews, only: [:create, :destroy]
  end

  get "/your_bookings", to: "reservations#your_bookings"
  get "/your_reservations", to: "reservations#your_reservations"


  get "/user/equipments/new", to: "equipments#new_fake", as: "fake_new_equipment"
end
