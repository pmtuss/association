Rails.application.routes.draw do
  root 'posts#index'
  
  namespace :admin do
    resources :users
  end

  resources :users do
    resources :posts 
    resources :profiles
    resources :cards
    resources :bank_infos
  end

  resources :posts do 
    resources :comments
  end

  resources :events do
    resources :comments
  end

end
