require 'rails_helper'

RSpec.describe ItemsController, type: :controller do
  include Devise::TestHelpers

  let(:user) { create(:user) }
  let(:item) { create(:item) }

  describe "CRUD actions" do
    context 'GET create' do
      it "returns http success" do
        get :create
        expect(response).to have_http_status(:success)
      end
    end


  end

end # end of Items controller Test
