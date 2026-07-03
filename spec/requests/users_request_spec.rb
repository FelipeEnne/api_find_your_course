require 'rails_helper'

RSpec.describe 'Users', type: :request do
  let!(:user) { create(:user) }

  describe 'GET /users' do
    before { get '/users' }

    it 'return json' do
      expect(JSON.parse(response.body).length).to eq(1)
    end

    it 'HTTP response 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /users/:id' do
    before { get "/users/#{user.id}" }

    it 'returns the user' do
      expect(JSON.parse(response.body)).not_to be_empty
      expect(JSON.parse(response.body)['id']).to eq(user.id)
      expect(JSON.parse(response.body)['name']).to eq(user.name)
    end

    it 'HTTP response 200' do
      expect(response).to have_http_status(200)
    end

    it 'does not expose password_digest' do
      expect(JSON.parse(response.body)).not_to have_key('password_digest')
    end
  end

  describe 'GET /users/:id error - id' do
    before { get '/users/99999' }

    it 'returns not found' do
      expect(response).to have_http_status(404)
    end
  end

  describe 'POST /login' do
    before { post '/login', params: { name: user.name, password: user.password } }

    it 'returns token and user' do
      body = JSON.parse(response.body)
      expect(body['token']).to be_present
      expect(body['user']['id']).to eq(user.id)
    end

    it 'HTTP response 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /login - error name' do
    before { post '/login', params: { name: '123', password: '123@qwe' } }

    it 'returns not found' do
      expect(JSON.parse(response.body)['error']).to eq('User not found')
    end

    it 'HTTP response 404' do
      expect(response).to have_http_status(404)
    end
  end

  describe 'POST /login - error password' do
    before { post '/login', params: { name: user.name, password: '123' } }

    it 'return false' do
      expect(JSON.parse(response.body)).to eq(false)
    end

    it 'HTTP response 422' do
      expect(response).to have_http_status(422)
    end
  end

  describe 'POST /users' do
    let(:attributes) do
      {
        name: 'name1',
        email: 'name1@email.com',
        password: 'name@123',
        password_confirmation: 'name@123',
        favorite: ''
      }
    end

    before { post '/users', params: attributes }

    it 'creates a user' do
      expect(JSON.parse(response.body)['name']).to eq('name1')
    end

    it 'returns status code 201' do
      expect(response).to have_http_status(201)
    end
  end

  describe 'POST /users -  no name' do
    let(:attributes) do
      {
        email: 'name1@email.com',
        password: 'name@123',
        password_confirmation: 'name@123',
        favorite: ''
      }
    end

    before { post '/users', params: attributes }

    it 'returns status code 422' do
      expect(response).to have_http_status(422)
    end

    it 'returns a validation failure message' do
      expect(response.body).to eq('false')
    end
  end

  describe 'POST /users -  different password' do
    let(:attributes) do
      {
        name: 'name1',
        email: 'name1@email.com',
        password: 'name@123',
        password_confirmation: 'name@1234',
        favorite: ''
      }
    end

    before { post '/users', params: attributes }

    it 'returns status code 422' do
      expect(response).to have_http_status(422)
    end

    it 'returns a validation failure message' do
      expect(response.body).to eq('false')
    end
  end

  describe 'PATCH /users' do
    before { patch "/users/#{user.id}", params: { favorite: 'Ruby' }, headers: auth_headers(user) }

    it 'returns' do
      expect(JSON.parse(response.body)['favorite']).to eq('Ruby')
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'PATCH /users without auth' do
    before { patch "/users/#{user.id}", params: { favorite: 'Ruby' } }

    it 'returns unauthorized' do
      expect(response).to have_http_status(401)
    end
  end

  describe 'DELETE /users' do
    before { delete "/users/#{user.id}", headers: auth_headers(user) }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
