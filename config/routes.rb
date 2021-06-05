Rails.application.routes.draw do
  devise_for :users

  resources :posts
  root to: "main#index"

end
