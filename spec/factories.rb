FactoryGirl.define do
  factory :student do 
    #sequence(:id) { |number| number }
   # id 1
    name "John"
    email  "john@example.com"
  end
end
