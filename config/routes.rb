Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  namespace 'api' do
    namespace 'v1' do
      resources :apps
      resources :users do
        collection do
          post 'sync_contacts'
        end
      end
    end
  end
end
