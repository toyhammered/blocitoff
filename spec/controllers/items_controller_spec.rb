require 'rails_helper'

RSpec.describe ItemsController, type: :controller do

  let(:my_user) { create(:user) }
  let(:other_user) { create(:user) }
  let(:my_item) { create(:item, user: my_user) }

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

    describe "DELETE destroy" do
      it 'deletes the item' do
        delete :destroy, {id: my_item.id}
        count = Item.where({id: my_item.id}).size
        expect(count).to eq 0
      end

      it 'redirects to users show' do
        delete :destroy, {id: my_item.id}
        expect(response).to redirect_to user_path(my_user.id)
      end
    end

  end # end of correct user

  context 'user doing CRUD on an item they do not own' do

  end # end of incorrect user

end # end of Items controller Test
