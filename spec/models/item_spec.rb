require 'rails_helper'

RSpec.describe Item, type: :model do


  # Create Item and User from factories
  let(:item) { create(:item) }
  let(:user) { create(:user) }

  # All Items must be associated with a User
  it { should belong_to(:user) }

  # Item validation
  it { should validate_presence_of(:name) }

  describe "attributes" do
    it 'should respond to name' do
      expect(item).to respond_to(:name)
    end
  end





end # end of Item model test
