require 'rails_helper'

RSpec.describe "Play", type: :request do
  describe "GET /play/choose" do
     it "starts the game" do
        get '/play/choose/'
        expect(response).to have_http_status(:success)
        expect(response.body).to match("Choose Your Throw")
     end

    it "determines winner" do
      get '/play/choose/?choice=Rock'
      expect(response.body).to match("Play Again?")
    end
  end
end