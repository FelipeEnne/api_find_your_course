require 'rails_helper'

RSpec.describe 'Users', type: :request do
  let!(:user) { create(:user) }

  it 'Test create' do
    expect(user.id).to eq(0)
    expect(user.name).to eq('name')
  end

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
    before { get '/users/0' }
    it 'returns the user' do
      expect(JSON.parse(response.body)).not_to be_empty
      expect(JSON.parse(response.body)['id']).to eq(0)
      expect(JSON.parse(response.body)['name']).to eq(user.name)
    end
    it 'HTTP response 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /users/:id error - id' do
    it 'returns the user' do
      expect{get '/users/1'}.to raise_exception(ActiveRecord::RecordNotFound)
    end
  end

  describe 'GET /login' do
    before { get '/login', params: { name: user.name, password: user.password } }

    it 'return name' do
      expect(JSON.parse(response.body)['id']).to eq(user.id)
    end

    it 'HTTP response 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /login - error name' do
    before { get '/login', params: { name: '123', password: user.password_digest } }

    it 'return false' do
      expect(JSON.parse(response.body)).to eq(false)
    end

    it 'HTTP response 422' do
      expect(response).to have_http_status(422)
    end
  end

  describe 'GET /login - error password' do
    before { get '/login', params: { name: user.name, password: '123' } }

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
      expect(response.body).to eq("false")
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
      expect(response.body).to eq("false")
    end
  end

  describe 'PATCH /users' do
    before { patch '/users/0', params: { id: 0, favorite: 'Ruby' } }

    it 'returns' do
      expect(JSON.parse(response.body)['favorite']).to eq('Ruby')
    end

    it 'returns status code ' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'DELETE /users' do
    before { delete '/users/0' }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
