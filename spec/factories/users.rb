
FactoryGirl.define do
  pw = "fakefake"

  factory :user do
    sequence(:email){|n| "user#{n}@factory.com"}
    password pw
    password_confirmation pw
    confirmed_at Time.now
  end

end
