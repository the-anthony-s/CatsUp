Rails.application.routes.draw do
  resources :users, path: 'users' do
    collection do
      get 'search'
    end
  end

  resources :channels, path: 'channels' do
    collection do
      get 'search'
    end

    resources :messages, path: 'messages'
  end
end
