Rails.application.routes.draw do
  resources :users, path: 'users'
  resources :channels, path: 'channels' do
    resources :messages, path: 'messages'
  end
end
