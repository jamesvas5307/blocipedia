require 'random_data'

5.times do
  User.create!(
    email: Faker::Internet.email,
    password: "Password1"
  )
end

users = User.all

User.create!(
email: 'admin@example.com',
password: 'Password1',
role: 'admin'
)

User.create!(
email: 'standard@example.com',
password: 'Password1'
)

User.create!(
email: 'premium@example.com',
password: 'Password1',
role: 'premium'
)
50.times do
  wiki = Wiki.create({
    user: users.sample,
    title: Faker::GameOfThrones.house,
    body: RandomData.random_paragraph,
    private: [true,false].sample
  })
end

private_wikis = Wiki.where(private: true)

private_wikis.each do |wiki|
  3.times do
    collaborator = Collaborator.create!({
      user: users.sample,
      wiki: wiki
      })
  end
end
