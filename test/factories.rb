FactoryBot.define do
  
  # TODO: fill in factory blueprint for store
  factory :store do
    name "Baskin Robbins"
    street "Qatar Foundation street"
    city "Doha"
    state "Education City"
    zip "29022"
    phone "444-666-3434"
    latitude 25.316142
    longitude 51.438476
    active true
  end

  # factory blueprint for employee
  factory :employee do
    first_name "Ahmad"
    last_name "Al-Kawari"
    ssn "298605180"
    date_of_birth 1998-11-24
    phone "3369522900"
    role "admin"
    active true
  end

  # factory blueprint for assignment
  factory :assignment do
    association :store
    association :employee
    start_date 1.day.ago.to_date
    end_date nil
    pay_level 6
  end
end