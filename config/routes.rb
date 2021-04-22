Rails.application.routes.draw do
  resources :users, path: 'users'
  resources :channels, path: 'channels'
end
