require 'rails_helper'

RSpec.describe 'Users test', type: :request do
  let!(:users) { create_list(:user, 10) }
  let(:user_id) { users.last.id }
  let(:user_name) { users.last.name }
  let(:user_email) { users.last.email }

  describe 'GET /users' do
    context 'without a query parameter' do
      before { get '/users' }

      it 'returns a paginated list of users' do
        expect(JSON.parse(response.body).size).to eq(10)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(:ok)
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

  # PUT /users/:id
  describe 'PUT /users/:id' do
    let(:valid_attributes) { { name: 'Wonderland' } }

    context 'when no record' do
      before { put "/users/#{user_id}", params: valid_attributes }

      it 'when update a record' do
        expect(response.body).to be_empty
      end
    end
  end

  # DELETE /users/:id
  describe 'DELETE /users/:id' do
    before { delete "/users/#{user_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(:no_content)
    end
  end

  # GET /users/search?name=params[:name]&email=params[:email]
  describe 'GET /users/search' do
    before { get "/users/search?name=#{user_name}&email=#{user_email}" }

    context 'when the record exists' do
      it 'returns the users' do
        expect(JSON.parse(response.body)).not_to be_empty
      end

      it 'contains the user' do
        expect(JSON.parse(response.body).first['name']).to eq(user_name)
        expect(JSON.parse(response.body).first['email']).to eq(user_email)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(:ok)
      end
    end

    context 'when the params are uppercase' do
      let(:user_name) { users.first.name.upcase }
      let(:user_email) { users.first.email.upcase }

      it 'returns the users' do
        expect(JSON.parse(response.body)).not_to be_empty
      end

      it 'contains the user in uppercase' do
        expect(JSON.parse(response.body).first['name'].upcase).to eq(user_name)
        expect(JSON.parse(response.body).first['email'].upcase).to eq(user_email)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(:ok)
      end
    end

    context 'when the record does not exist' do
      let(:user_name) { 'veryyyyyyllllooooongname' }
      let(:user_email) { 'veryyyylongemaail@gmail.com' }

      it 'returns status code 200' do
        expect(response).to have_http_status(:ok)
      end

      it 'returns an empty array' do
        expect(JSON.parse(response.body)).to be_empty
      end
    end
  end
end
