Rails.application.routes.draw do
  devise_for :users
  resources :posts do
      member do
        get "like", to: "posts#up_vote"
        get "dislike", to: "posts#down_vote"
      end
      resources :comments
  end
 
 root 'posts#index'
end
