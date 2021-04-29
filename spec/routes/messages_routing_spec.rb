require 'rails_helper'

RSpec.describe MessagesController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/channels/1/messages').to route_to('messages#index', channel_id: '1')
    end

    it 'routes to #show' do
      expect(get: '/channels/1/messages/1').to route_to('messages#show', channel_id: '1', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/channels/1/messages').to route_to('messages#create', channel_id: '1')
    end

    it 'routes to #update via PUT' do
      expect(put: '/channels/1/messages/1').to route_to('messages#update', channel_id: '1', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/channels/1/messages/1').to route_to('messages#update', channel_id: '1', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/channels/1/messages/1').to route_to('messages#destroy', channel_id: '1', id: '1')
    end
  end
end
