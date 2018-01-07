class Community < ApplicationRecord
  has_many :users
  has_many :issues, dependent: :destroy

  validates :name, presence: true
end
