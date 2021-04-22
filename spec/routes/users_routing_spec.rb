require 'rails_helper'

RSpec.describe UsersController, type: :routing do
  describe 'routing' do
    it 'routes to index' do
      expect(get: '/users').to route_to('users#index')
    end

    it 'routes to create action' do
      expect(post: '/users').to route_to('users#create')
    end

    it 'routes to show action' do
      expect(get: '/users/1').to route_to('users#show', id: '1')
    end

    it 'routes to update action, method: PUT' do
      expect(put: 'users/1').to route_to('users#update', id: '1')
    end

    it 'routes to update action, method: PATCH' do
      expect(patch: 'users/1').to route_to('users#update', id: '1')
    end

    it 'routes to destroy action' do
      expect(delete: '/users/1').to route_to('users#destroy', id: '1')
    end
  end
end