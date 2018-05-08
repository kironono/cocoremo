Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  use_doorkeeper

  devise_for :admins
  devise_for :users

  authenticated :user do
    root to: "home#index", as: :dashboard
  end
  root to: "top#index"

  resources :node_devices, only: [:index, :edit, :update]
  resources :home_appliances, expect: [:show]

  scope module: :api, defaults: { format: 'json' } do
    constraints subdomain: 'api', format: 'json' do
      namespace :v1 do
        resource :user, only: [:show]

        match "/", to: "application#not_found", via: :all
        match "*path", to: "application#not_found", via: :all
      end
    end
  end

end
