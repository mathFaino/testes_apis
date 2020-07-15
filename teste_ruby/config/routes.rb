Rails.application.routes.draw do
  get 'login/create'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace 'api' do
    namespace 'v1' do
      resources :users
      resources :feirantes
      resources :login
    end
  end

end
