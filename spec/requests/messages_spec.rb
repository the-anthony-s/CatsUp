require 'rails_helper'

RSpec.describe 'Messages', type: :request do
  let!(:user) { create(:user) }
  let!(:channel) { create(:channel, user_id: user.id) }
  let!(:messages) { create_list(:message, 20, channel_id: channel.id, user_id: user.id) }
  let(:channel_id) { channel.id }
  let(:user_id) { user.id }
  let(:id) { messages.first.id }

  # Test suite for GET /channels/:channel_id/messages
  describe 'GET /channels/:channel_id/messages' do
    before { get "/channels/#{channel_id}/messages" }

    context 'when channel exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(:ok)
      end

      it 'returns all channel messages' do
        expect(JSON.parse(response.body).size).to eq(20)
      end
    end

    context 'when channel does not exist' do
      let(:channel_id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(:not_found)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Channel/)
      end
    end
  end

  # Test suite for GET /channels/:channel_id/messages/:id
  describe 'GET /channels/:channel_id/messages/:id' do
    before { get "/channels/#{channel_id}/messages/#{id}" }

    context 'when channel message exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(:ok)
      end

      it 'returns the message' do
        expect(JSON.parse(response.body)['id']).to eq(id)
      end
    end

    context 'when channel message does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Message/)
      end
    end
  end

  # Test suite for PUT /channels/:channel_id/messages
  describe 'POST /channels/:channel_id/messages' do
    let(:valid_attributes) { { message: 'Do not forget to sleep Anton...', user_id: user_id } }

    context 'when request attributes are valid' do
      before { post "/channels/#{channel_id}/messages", params: valid_attributes }

      it 'returns status code 201' do
        expect(response).to have_http_status(:created)
      end
    end

    context 'when an invalid request' do
      before { post "/channels/#{channel_id}/messages", params: {} }

      it 'returns status code 422' do
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'returns a failure message' do
        expect(response.body).to match(/Validation failed: Body can't be blank/)
      end
    end
  end

  # Test suite for PUT /channels/:channel_id/messages/:id
  describe 'PUT /channels/:channel_id/messages/:id' do
    let(:valid_attributes) { { message: 'Anton, you are still working... Good job', user_id: user_id } }

    before { put "/channels/#{channel_id}/messages/#{id}", params: valid_attributes }

    context 'when message exists' do
      it 'returns status code 204' do
        expect(response).to have_http_status(:no_content)
      end

      it 'updates the message' do
        updated_message = Message.find(id)
        expect(updated_message.message).to match(/Anton/)
      end
    end

    context 'when the message does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(:not_found)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Message/)
      end
    end
  end

  # Test suite for DELETE /channels/:channel_id/messages/:id
  describe 'DELETE /channels/:id' do
    before { delete "/channels/#{channel_id}/messages/#{id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(:no_content)
    end
  end
end
