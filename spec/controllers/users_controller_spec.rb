require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  include Devise::TestHelpers

  describe "signed in user" do
    let(:factory_user) { create(:user) }

  end


end
