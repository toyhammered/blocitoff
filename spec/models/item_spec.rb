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

  describe 'scopes' do
    before do
      @current_task = Item.create!(name: Faker::Lorem.sentence(3), created_at: 3.days.ago, completed_at: nil)
      @completed_task = Item.create!(name: Faker::Lorem.sentence(3), created_at: 3.days.ago, completed_at: Time.now)
      @expired_task = Item.create!(name: Faker::Lorem.sentence(3), created_at: 9.days.ago, completed_at: nil)
    end

    describe ".current" do
      it 'should only get tasks that are current' do
        current_tasks = Item.current
        expect(current_tasks).to eq([@current_task])
      end
    end

    describe ".completed" do
      it 'should only get tasks that are completed' do
        completed_tasks = Item.completed
        expect(completed_tasks).to eq([@completed_task])
      end
    end

    describe ".expired" do
      it 'should only get tasks that are expired' do
        expired_tasks = Item.expired
        expect(expired_tasks).to eq([@expired_task])
      end
    end
  end





end # end of Item model test
