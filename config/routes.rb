Rails.application.routes.draw do
  namespace 'api' do
    root 'terminals#index'
    resources :terminals
  end
end
