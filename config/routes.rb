Rails.application.routes.draw do
  root 'terminals#index'
  scope 'api' do
    resources :terminals
  end
end
