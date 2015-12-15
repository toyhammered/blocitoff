1.times do
  user = User.create!(
    email: "daniel@rassiner.com",
    password: "fakefake",
    password_confirmation: "fakefake",
    confirmed_at: Time.now
  )

end

5.times do
  user = User.create!(
    email: Faker::Internet.safe_email,
    password: "fakefake",
    password_confirmation: "fakefake",
    confirmed_at: Time.now
  )

end
users = User.all

# current tasks
40.times do
  item = Item.create!(
    name: Faker::Lorem.sentence(3),
    user: users.sample
  )
  item.update_attributes(created_at: Faker::Time.backward(7, :all))
  item.update_attributes(completed_at: nil)
end

# completed tasks
40.times do
  item = Item.create!(
    name: Faker::Lorem.sentence(3),
    user: users.sample
  )
  item.update_attributes(created_at: Faker::Time.backward(7, :all))
  item.update_attributes(completed_at: Time.now)

end

# expired tasks
40.times do
  item = Item.create!(
    name: Faker::Lorem.sentence(3),
    user: users.sample
  )
  item.update_attributes(created_at: Faker::Time.between(8.days.ago, 14.days.ago, :all))
  item.update_attributes(completed_at: nil)
end

puts "Seeding Finished."
puts "#{User.count} users created."
puts "#{Item.count} items created."
