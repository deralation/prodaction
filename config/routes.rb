Rails.application.routes.draw do

  root to: 'pages#home'

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' } do
  end

  resources :users, only: [:show, :index, :new, :create, :edit, :update] do
    resources :equipments
  end

  resources :equipments do
    resources :availabilities, only: [:create , :show, :index]
  end


  get "/user/equipments/new", to: "equipments#new_fake", as: "fake_new_equipment"
end
