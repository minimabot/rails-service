Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check

  constraints subdomain: 'admin' do
    scope module: 'admin', as: 'admin' do
      root to: 'home#index'
    end
  end

  constraints subdomain: 'www' do
    scope module: 'client', as: 'client' do
      root to: 'home#index'
    end
  end

  constraints subdomain: 'api' do
    scope '/v1', module: 'v1', as: 'v1' do
      get 'users', to: 'users#index'
    end
  end
end
