require 'rails_helper'

RSpec.describe "Purchas", type: :request do
  before do
    @purcha = FactoryBot
  end

  describe "GET /index" do
    it "returns http success" do
      get "/purchas/index"
      expect(response).to have_http_status(:success)
    end
  end
end