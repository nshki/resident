require 'securerandom'

FactoryBot.define do
  factory :user do
    email 'chuck@testa.com'
    password 'Alskdjfhg1!'
    code 'invitecode'
  end
end
