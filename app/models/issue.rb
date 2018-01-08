class Issue < ApplicationRecord
  belongs_to :community
  belongs_to :user
  has_many :favorites, dependent: :destroy

  validates :title, :description, presence: true
end
