Rails.application.routes.draw do

  root to: 'pages#home'

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' } do
    match '/users/sign_in' => "devise/sessions#new", :as => :login
  end

  resources :users, only: [:show, :index, :new, :create] do
    resources :equipments
  end
end
