require 'faker'

member = User.new(
  name: 'Jennifer Lanre',
  email: 'admin@tickit.com',
  password: 'helloworld'
)
member.skip_confirmation!
member.save!

member = User.new(
  name: 'Opal Crystal',
  email: 'mod@tickit.com',
  password: 'helloworld'
)
member.skip_confirmation!
member.save!

puts "Seed finished"
puts "#{User.count} users created"