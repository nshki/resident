FactoryBot.define do
  factory :community do
    name ENV.fetch('DEFAULT_COMMUNITY') || 'Default Community'
  end
end
