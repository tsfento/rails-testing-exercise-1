FactoryBot.define do
  factory :article do
    title { Faker::Lorem.sentence }
    content { Faker::Lorem.paragraph_by_chars(number: 100) }
  end
end
