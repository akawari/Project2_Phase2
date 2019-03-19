FactoryBot.define do
  factory :assignment do
    store_id { 1 }
    employee_id { 1 }
    start_date { "2019-03-19" }
    end_date { "2019-03-19" }
    pay_level_integer { "MyString" }
  end
end
