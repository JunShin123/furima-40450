FactoryBot.define do
  factory :user do
    transient do
      person {Gimei.name}
    end

    nickname {Faker::Name.name}
    email {Faker::Internet.email}
    password {'1a' + Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    family_name { person.last.kanji }
    first_name  { person.first.kanji }
    read_family { person.last.katakana }
    read_first { person.first.katakana }
    birthday {Faker::Date.between(from: '1930-01-01', to: 5.years.ago)}  
  end
end