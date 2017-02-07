Rails.application.routes.draw do
  root 'posts#index'
  resources :users do
    resources :comments
    resources :posts do
      resources :comments
    end
  end
end
