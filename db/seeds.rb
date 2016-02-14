1.times do
  user = User.create!(
    username: "toyhammered",
    email: "daniel@rassiner.com",
    password: "fakefake",
    password_confirmation: "fakefake",
    confirmed_at: Time.now
  )

end

5.times do
  user = User.create!(
    username: Faker::Internet.user_name,
    email: Faker::Internet.safe_email,
    password: "fakefake",
    password_confirmation: "fakefake",
    confirmed_at: Time.now
  )

end
users = User.all

# current tasks
20.times do
  item = Item.create!(
    name: Faker::Lorem.sentence(3),
    user: users.sample
  )
  item.update_attributes(created_at: Faker::Time.backward(7, :all))
  item.update_attributes(completed_at: nil)
end

# completed tasks
20.times do
  item = Item.create!(
    name: Faker::Lorem.sentence(3),
    user: users.sample
  )
  item.update_attributes(created_at: Faker::Time.backward(7, :all))
  item.update_attributes(completed_at: Time.now)

end

# expired tasks
20.times do
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
