require 'rails_helper'

RSpec.describe ItemsController, type: :controller do

  let(:my_user) { create(:user) }
  let(:other_user) { create(:user) }
  let(:item) { create(:item, user: my_user) }

  context 'user doing CRUD on an item they do own' do
    before :each do
      login_as my_user
    end
    describe "POST create" do
      it 'increases the number of Item by 1' do
        expect{ post :create, item: {name: Faker::Lorem.sentence(3)} }.to change(Item,:count).by(1)
      end

      it 'assigns the new item to @item' do
        post :create, item: { name: Faker::Lorem.sentence(3)}
        expect(assigns(:item)).to eq Item.last
      end
    end

  end # end of correct user

  context 'user doing CRUD on an item they do not own' do

  end # end of incorrect user

end # end of Items controller Test
