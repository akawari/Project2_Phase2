FactoryBot.define do
  factory :store do
    name { "MyString" }
    street { "MyString" }
    city { "MyString" }
    state { "MyString" }
    zip { "MyString" }
    phone { "MyString" }
    longitude { 1.5 }
    latitude { 1.5 }
    active { false }
  end
end
