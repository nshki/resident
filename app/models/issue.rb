class Issue < ApplicationRecord
  has_many :favorites, dependent: :destroy

  validates :title, :description, presence: true
end
