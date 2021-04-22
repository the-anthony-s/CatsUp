require 'rails_helper'

RSpec.describe 'Channels test', type: :request do
  # initialize test data
  let!(:user) { create(:user) }
  let!(:channels) { create_list(:channel, 10, user: user.id) }
  let(:first_channel) { channels.first }
  let(:channel_id) { first_channel.id }
  let(:channel_name) { first_channel.name }

  # test :index
  # GET /channels
  describe 'GET /channels' do
    # make HTTP get request before each example
    before { get '/channels' }

    it 'returns all channels' do
      # Note `json` is a custom helper to parse JSON responses
      expect(JSON.parse(response.body)).not_to be_empty
      expect(JSON.parse(response.body).size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # test :show
  # GET /channels/:id
  describe 'GET /channels/:id' do
    before { get "/channels/#{channel_id}" }

    context 'when the record exists' do
      it 'returns the user' do
        expect(JSON.parse(response.body)).not_to be_empty
        expect(JSON.parse(response.body)['id']).to eq(channel_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:channel_id) { Channel.last.id.to_i + 10 }

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Channel/)
      end
    end
  end

  # test :creat
  # POST /channels
  describe 'POST /channels' do
    # valid payload
    let(:valid_attributes) { { name: 'Cats vs Dogs', user_id: user.id } }

    context 'when the request is valid' do
      before { post '/channels', params: valid_attributes }

      it 'creates a channel' do
        expect(JSON.parse(response.body)['name']).to eq('Cats vs Dogs')
      end
    end

    context 'when the request is valid but channel exists' do
      let(:valid_attributes) { { name: first_channel.name, user_id: user.id } }
      before { post '/channels', params: valid_attributes }

      it 'returns a validation failure message' do
        expect(response.body).to match(/Validation failed: Unique constraint error/)
      end
    end

    context 'when the request is invalid' do
      before { post '/channels', params: { name: 'Foobar' } }

      it 'returns a validation failure message' do
        expect(response.body).to match(/Validation failed: User must exist/)
      end
    end
  end

  # test :create
  # PUT /channels/:id
  describe 'PUT /channels/:id' do
    let(:valid_attributes) { { name: 'Cats for the win', user_id: user.id } }

    context 'when the record exists' do
      before { put "/channels/#{channel_id}", params: valid_attributes }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  # Test suite for DELETE /channels/:id
  describe 'DELETE /channels/:id' do
    before { delete "/channels/#{channel_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
