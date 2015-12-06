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

40.times do
  item = Item.create!(
    name: Faker::Lorem.sentence(3),
    user: users.sample
  )
end

puts "Seeding Finished."
puts "#{User.count} users created."
puts "#{Item.count} items created."
