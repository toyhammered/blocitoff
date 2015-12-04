require 'rails_helper'

RSpec.describe ItemsController, type: :controller do
  include Devise::TestHelpers
  
  describe "GET #create" do
    it "returns http success" do
      get :create
      expect(response).to have_http_status(:success)
    end
  end

end
