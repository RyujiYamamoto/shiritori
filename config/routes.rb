Rails.application.routes.draw do
  get 'rooms/show'
  root 'sessions#new'
  get '/login', to: 'sessions#new'
  post'/login', to: 'sessions#create'
  delete '/logout', to:'sessions#destroy'
  get 'shiritori_messages/index'
  resources :users
  resources :rooms
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
