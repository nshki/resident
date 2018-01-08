FactoryBot.define do
  factory :issue do
    title "Test Issue"
    description "Issue description"
    community
    user
  end
end
