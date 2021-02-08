require 'rails_helper'
require 'pry'

RSpec.describe 'Api::V1::Properties', type: :request do
  let(:user) { create(:user) }
  let(:login_url) { '/login' }
  let(:published_properties) { create(:published_properties) }
  let(:rented_roperties) { create(:rented_roperties) }
  let(:removed_roperties) { create(:removed_roperties) }

  before do
    post login_url, params: {
      user: {
        email: user.email,
        password: 'sJcwP0WmTH'
      }
    }
    @token = response.headers['Authorization']
  end

  describe 'GET /index' do
    it 'returns http success' do
      get '/api/v1/properties/', headers: { Authorization: @token }
      expect(response).to have_http_status(:success)
    end

    it 'returns an array' do
      get '/api/v1/properties/', headers: { Authorization: @token }
      expect(JSON.parse(response.body)['properties']).to be_an(Array)
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get '/api/v1/properties/', headers: { Authorization: @token }
      expect(response).to have_http_status(:success)
    end

    it 'retrieves a specific property' do
      get "/api/v1/properties/#{published_properties.id}",
          headers: { Authorization: @token }
      expect(JSON.parse(response.body)['property']).not_to be(nil)
    end
  end

  describe 'POST /create' do
    it 'returns http success' do
      get '/api/v1/properties/', headers: { Authorization: @token }
      expect(response).to have_http_status(:success)
    end

    it 'returns http created success' do
      post '/api/v1/properties/', params: {
        property: {
          name: 'Acme',
          description: 'RSpec Test',
          price: '0.4452e2',
          status: 'published',
          owner_name: 'Acme Owner',
          owner_phone: '+52-55-1234-1234'
        }
      }, headers: { Authorization: @token }
      expect(response.code.to_i).to be(201)
    end

    it 'returns a created property' do
      post '/api/v1/properties/', params: {
        property: {
          name: 'Acme',
          description: 'RSpec Test',
          price: '0.4452e2',
          status: 'published',
          owner_name: 'Acme Owner',
          owner_phone: '+52-55-1234-1234'
        }
      }, headers: { Authorization: @token }
      expect(JSON.parse(response.body)['property']['name']).to eq('Acme')
    end
  end

  describe 'UPDATE /put' do
    it 'returns http success' do
      get '/api/v1/properties/', headers: { Authorization: @token }
      expect(response).to have_http_status(:success)
    end

    it 'returns http code 200' do
      put "/api/v1/properties/#{published_properties.id}", params: {
        property: {
          name: "Updated name"
        }
      }, headers: { Authorization: @token }
      expect(response.code.to_i).to be(200)
    end

    it 'updated a property' do
      put "/api/v1/properties/#{published_properties.id}", params: {
        property: {
          name: "Updated name"
        }
      }, headers: { Authorization: @token }
      expect(JSON.parse(response.body)['property']['name']).to eq('Updated name')
    end
  end

  describe 'DELETE /delete' do
    it 'returns http deleted' do
      delete "/api/v1/properties/#{published_properties.id}",
          headers: { Authorization: @token }
      expect(response.code.to_i).to be(204)
    end
  end
end
