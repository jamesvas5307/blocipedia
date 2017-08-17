require 'random_data'

5.times do
  User.create!(
    email: RandomData.random_email,
    password: RandomData.random_sentence
  )
end

users = User.all

User.create!(
email: 'user@example.com',
password: 'Password1/'
)
50.times do
  wiki = Wiki.create({
    user: users.sample,
    title: RandomData.random_sentence,
    body: RandomData.random_paragraph,
    private: false
  })
end
