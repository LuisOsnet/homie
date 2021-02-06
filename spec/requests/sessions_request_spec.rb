require 'rails_helper'
require 'devise'
require 'pry'

RSpec.describe "Sessions", type: :request do
  describe 'POST /create' do
    let(:user) { create(:user) }
    let(:login_url) { '/login' }
    let(:logout_url) { '/logout' }

    context 'When login' do
      before do
        post login_url, params: {
          user: {
            email: user.email,
            password: 'sJcwP0WmTH'
          }
        }
      end

      it 'returns a token' do
        expect(response.headers['Authorization']).to be_present
      end

      it 'returns 200' do
        expect(response.status).to eq(200)
      end
    end

    context 'When password is missing' do
      before do
        post login_url, params: {
          user: {
            email: user.email,
            password: nil
          }
        }
      end

      it 'returns nil headers' do
        expect(response.headers['Authorization']).to be_nil
      end
    end
  end

  describe 'DELETE /destroy' do
    let(:user) { create(:user) }
    let(:logout_url) { '/logout' }

    context 'When logout' do
      it 'returns 204' do
        delete logout_url
        expect(response).to have_http_status(204)
      end
    end
  end
end
