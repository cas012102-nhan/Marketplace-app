Rails.application.routes.draw do
  devise_for :users
  resources :categories
  resources :posts do
  
    resources :comments
  end
  # get "/posts/:cate", to: "posts#index", as: "posts_category"
  get "/posts/categories/:cate", to: "posts#index", as: "posts_category"
  root to: "posts#index"
  
  
 

end
