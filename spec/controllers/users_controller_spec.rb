require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  include Devise::TestHelpers

  describe "signed in user" do
    let(:factory_user) { create(:user) }

    it 'returns http success' do
      get :show, { id: factory_user.id }
      expect(response).to have_http_status(302)
    end
  end


end
