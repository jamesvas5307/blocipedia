module RandomData
  def self.random_paragraph
    sentences = []
    rand(4..6).times do
      sentences << random_sentence
    end
    sentences.join(" ")
  end

    def self.random_sentence
      strings = []
      rand(1..2).times do
        strings << "<p><strong>#{Faker::GameOfThrones.character.capitalize}</strong> kills <strong>#{Faker::GameOfThrones.character.capitalize}</strong> at <small>#{Faker::GameOfThrones.city.capitalize}</small>.</p>"
      end
      sentence = strings.join(" ")
      sentence = sentence.capitalize
    end

    def self.random_word
      letters= ('a'..'z').to_a
      letters.shuffle!
      letters[0,rand(3..8)].join
    end

    def self.random_name
      first_name = random_word.capitalize
      last_name = random_word.capitalize
      "#{first_name} #{last_name}"
    end

    def self.random_email
      "#{random_word}@#{random_word}.#{random_word}"
    end

    def self.random_number
      number = rand(50..500)
    end
end
