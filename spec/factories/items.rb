FactoryGirl.define do
  factory :item do
    name Faker::Lorem.sentence(3)
    user
  end

end
