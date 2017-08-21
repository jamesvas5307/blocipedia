require 'random_data'

5.times do
  User.create!(
    email: Faker::Internet.email,
    password: RandomData.random_sentence
  )
end

users = User.all

User.create!(
email: 'user@example.com',
password: 'Password1',
role: 'admin'
)

User.create!(
email: 'standard@example.com',
password: 'Password1'
)
50.times do
  wiki = Wiki.create({
    user: users.sample,
    title: Faker::GameOfThrones.house,
    body: RandomData.random_paragraph,
    private: false
  })
end
