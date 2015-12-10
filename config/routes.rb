Rails.application.routes.draw do
  root to: 'pages#home'

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' } do
  end

  resources :users, only: [:show, :index, :new, :create, :edit, :update, :index] do
    resources :equipments, controller: :user_equipments do
    end
  end
  resources :equipments
  resources :user_equipments

  resources :equipments, controller: :user_equipments do
  end

  resources :equipments do
    resources :reservations, only: [:create]
  end


  get "/user/equipments/new", to: "equipments#new_fake", as: "fake_new_equipment"
end
