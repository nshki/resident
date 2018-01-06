class Invite < ApplicationRecord
  validates :code, presence: true, uniqueness: true
end
