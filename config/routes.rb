Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  get '/auth/google_oauth2/callback', to: 'sessions#create'
  get '/dashboard', to: 'users#show'
  get '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  patch '/users/:id', to: 'users#update'
  resources :plants, only: [:index]
end
