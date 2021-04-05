Rails.application.routes.draw do
  resources :employees
  resources :organisations
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
end
