require 'rails_helper'

RSpec.describe ItemsController, type: :controller do

  let(:my_user) { create(:user) }
  let(:other_user) { create(:user) }

  before(:each) do
    sign_in my_user
  end

  context 'my user doing CRUD on an item they do own' do

    describe "POST create" do
      it 'increases the number of Item by 1' do
        expect{ post :create, user_id: my_user.id, item: {name: Faker::Lorem.sentence(3)} }.to change(Item,:count).by(1)
      end

      it 'assigns the new item to @item' do
        post :create, user_id: my_user.id, item: { name: Faker::Lorem.sentence(3)}
        expect(assigns(:item)).to eq Item.last
      end
    end

    describe "DELETE destroy" do
      it 'deletes the item' do
        my_item = create(:item, user: my_user)

        count = Item.where({id: my_item.id}).size
        expect(count).to eq 1

        delete :destroy, {id: my_item.id, user_id: my_user.id}

        count = Item.where({id: my_item.id}).size
        expect(count).to eq 0
      end

      it 'redirects to users show' do
        my_item = create(:item, user: my_user)
        delete :destroy, {id: my_item.id, user_id: my_user.id}
        expect(response).to redirect_to user_path(my_user.id)
      end
    end

  end # end of correct user

  context 'my other user doing CRUD on an item they do not own' do
    describe "log in and log out user" do
      it 'should not have a current_user' do
        expect{ sign_out my_user }.to change{ subject.current_user }.to nil
      end

      it 'should assign other_user to current_user' do
        sign_out my_user
        expect{ sign_in other_user }.to change{ subject.current_user }.to other_user
      end
    end

    describe "DELETE destroy" do
      it 'returns http redirect with error message' do
        my_item = create(:item, user: my_user)

        sign_out my_user
        sign_in other_user

        delete :destroy, {id: my_item.id, user_id: my_user.id}
        expect(flash[:error]).to eq("You do not have the authority to do that task")
      end

    end
  end # end of incorrect user

end # end of Items controller Test
