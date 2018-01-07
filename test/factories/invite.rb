require 'securerandom'

FactoryBot.define do
  factory :invite do
    code SecureRandom.hex(10)
  end
end
