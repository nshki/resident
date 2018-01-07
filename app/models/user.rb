class User < ApplicationRecord
  include Clearance::User

  validates :code, presence: true
end
