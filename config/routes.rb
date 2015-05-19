Rails.application.routes.draw do
  scope 'api' do
    root 'terminals#index'
    resources :terminals
  end
end
