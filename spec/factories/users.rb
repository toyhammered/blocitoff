FactoryGirl.define do
  pw = "fakefake"

  factory :user do
    sequence(:email){|n| "user#{n}@factory.com"}
    password pw
    password_confirmation pw
  end

end
