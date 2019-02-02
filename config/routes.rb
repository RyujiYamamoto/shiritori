Rails.application.routes.draw do
  resources :users
  root 'shiritori_messages#index'
  get 'shiritori_messages/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
