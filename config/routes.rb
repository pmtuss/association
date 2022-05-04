Rails.application.routes.draw do
  root 'posts#index'
  get 'login', to: "sessions#new"
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  namespace :admin do
    resources :users, only: [:index, :show] do
      get 'export_csv', on: :collection
    end
  end

  resources :users do
    resources :posts 
    resource :profile
    resource :card
    resource :bank_info
  end

  resources :posts, :events do 
    resources :comments
  end

end
