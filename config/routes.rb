Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :users

  authenticated :user do
    root to: "home#index", as: :dashboard
  end
  root to: "top#index"

  resources :devices

  scope module: :api, defaults: { format: 'json' } do
    constraints subdomain: 'api', format: 'json' do
      namespace :v1 do
        match "*path", to: "application#not_found", via: :all
      end
    end
  end

end
