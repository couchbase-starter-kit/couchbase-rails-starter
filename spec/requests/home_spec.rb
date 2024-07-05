require 'rails_helper'

RSpec.describe 'Home', type: :request do
  describe 'GET /' do
    it 'returns the root index view' do
      headers = { 'Content-Type': 'application/html' }

      get('/', headers:)

      expect(response).to have_http_status(:ok)
    end
  end
end
