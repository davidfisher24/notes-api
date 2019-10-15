FactoryBot.define do
  factory :note do
    title { Faker::Lorem.word }
    text { Faker::Lorem.sentence }
    created_by { Faker::Number.number(10) }
  end
end
