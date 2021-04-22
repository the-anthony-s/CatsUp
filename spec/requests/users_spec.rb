require 'rails_helper'

RSpec.describe 'User test', type: :request do
  let!(:users) { create_list(:user, 10) }
  let(:user_id) { users.last.id }
  let(:user_name) { users.last.name }
  let(:user_email) { users.last.email }

  # test :index
  # GET /users
  describe 'index action -> GET /users' do
    context 'when params ids is not defined' do
      before { get '/users' }

      it 'returns users' do
        expect(JSON.parse(response.body)).not_to be_empty
        expect(JSON.parse(response.body).size).to eq(10)
      end

      it 'returns 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when params ids is defined' do
      before { get "/users?ids=#{users[1].id},#{users[2].id},#{users[3].id}" }

      it 'returns users' do
        expect(JSON.parse(response.body)).not_to be_empty
        expect(JSON.parse(response.body).size).to eq(3)
      end

      it 'returns 200' do
        expect(response).to have_http_status(200)
      end
    end
  end

  # test :show
  # GET /users/:id
  describe 'GET /users/:id' do
    before { get "/users/#{user_id}" }

    context 'when a record exists' do
      it 'returns the user' do
        expect(JSON.parse(response.body)).not_to be_empty
        expect(JSON.parse(response.body)['id']).to eq(user_id)
      end
    end

    context 'when no record exists' do
      let(:user_id) { User.last.id.to_i + 10 }

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find User/)
      end
    end
  end

  # test :create
  # PUT /users
  describe 'POST /users' do
    # valid payload
    let(:valid_attributes) { { name: users.first.name, email: users.first.email } }

    context 'when the request is valid' do
      before { post '/users', params: valid_attributes }

      it 'creates a user' do
        expect(JSON.parse(response.body)['name']).to eq(users.first.name)
      end
    end

    context 'when the request is valid but user exists' do
      before { post '/users', params: { name: 'Marco Polo', email: 'marco.polo@homestars.com' } }

      it 'returns a validation failure message' do
        expect(response.body).to match(/Validation failed: Unique constraint error/)
      end
    end

    context 'when the request is invalid' do
      before { post '/users', params: { name: 'Marco' } }

      it 'returns a validation failure message' do
        expect(response.body).to match(/Validation failed: Email can't be blank/)
      end
    end
  end

  # Test suite for PUT /users/:id
  describe 'PUT /users/:id' do
    let(:valid_attributes) { { name: 'Wonderland' } }

    context 'when no record' do
      before { put "/users/#{user_id}", params: valid_attributes }

      it 'when update a record' do
        expect(response.body).to be_empty
      end
    end
  end

  # Test suite for DELETE /users/:id
  describe 'DELETE /users/:id' do
    before { delete "/users/#{user_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
