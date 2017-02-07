Rails.application.routes.draw do
  root 'posts#index'
  resources :users do
    resources :posts
  end
end
