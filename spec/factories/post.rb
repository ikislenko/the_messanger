FactoryGirl.define do
  factory :post do
    title 'test title'
    content 'test content'
    association :user, factory: :user
  end
end
