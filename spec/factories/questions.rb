FactoryGirl.define do
  factory :question do
    category
    question { generate(:question) }
  end
end
