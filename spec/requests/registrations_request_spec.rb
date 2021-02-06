require 'rails_helper'
require 'devise'
require 'pry'

RSpec.describe 'Registrations', type: :request do
  describe 'POST /create' do
    let(:user) { create(:user) }
    let(:signup_url) { '/signup' }

    it 'ensures email presence' do
      expect(user.email.present?).to be true
    end

    it 'Creates new user' do
      post signup_url, params: {
        user: {
          email: 'test@example.com',
          password: 'sJcwP0WmTH'
        }
      }
      body = JSON.parse(response.body)
      expect(response.status).to eq(201)
      expect(body['jti']).not_to be_empty
    end
  end
end
