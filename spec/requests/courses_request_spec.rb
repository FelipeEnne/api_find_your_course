require 'rails_helper'

RSpec.describe 'Courses', type: :request do
  let!(:course) { create(:course) }

  it 'Test create' do
    expect(course.id).to eq(0)
    expect(course.name).to eq('RubyonRails')
  end

  describe 'GET /courses' do
    before { get '/courses' }

    it 'return json' do
      expect(JSON.parse(response.body).length).to eq(1)
    end

    it 'HTTP response 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /courses/:id' do
    before { get '/courses/0' }
    it 'returns the user' do
      expect(JSON.parse(response.body)).not_to be_empty
      expect(JSON.parse(response.body)['id']).to eq(0)
      expect(JSON.parse(response.body)['name']).to eq(course.name)
    end
    it 'HTTP response 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /courses/:id error - id' do
    it 'returns the courses' do
      expect{get '/courses/40'}.to raise_exception(ActiveRecord::RecordNotFound)
    end
  end


  describe 'POST /courses' do
    let(:attributes) do
      {
        name: 'Ruby',
        owner: 'Ruby@Course',
        starts: 4,
        value: 20,
        description: 'You will learn everything about Ruby',
        image: 'image'
      }
    end

    before { post '/courses', params: attributes }
    it 'creates a user' do
      expect(JSON.parse(response.body)['name']).to eq('Ruby')
    end

    it 'returns status code 201' do
      expect(response).to have_http_status(201)
    end
  end

  describe 'POST /courses -  no name' do
    let(:attributes) do
      {
        owner: 'Ruby@Course',
        starts: 4,
        value: 20,
        description: 'You will learn everything about Ruby',
        image: 'image'
      }
    end

    before { post '/courses', params: attributes }
    it 'returns status code 422' do
      expect(response).to have_http_status(422)
    end
    it 'returns a validation failure message' do
      expect(response.body).to eq("false")
    end
  end

  describe 'DELETE /courses' do
    before { delete '/courses/0' }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
