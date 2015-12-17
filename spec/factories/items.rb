FactoryGirl.define do
  factory :item do
    name Faker::Lorem.sentence(3)
    user
    completed_at nil
  end

end
