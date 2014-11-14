Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  namespace 'api' do
    namespace 'v1' do
      resources :apps
      resources :users do
      end
    end
  end
end
