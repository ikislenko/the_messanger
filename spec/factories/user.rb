FactoryGirl.define do
  factory :user do
    sequence(:email) { |_n| "user#{format('%10.9f', Time.now.to_f)}@test.com" }
    provider 'faceboock'
    uid '12345'
    name 'John Doe'
    picture ''
  end
end
