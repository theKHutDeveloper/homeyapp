require 'rails_helper'

RSpec.describe "Sessions", type: :request do
  describe "GET /login" do
    it 'displays the sign up form' do
      get "/login"
      expect(response).to have_http_status(:success)
    end
  end
end
