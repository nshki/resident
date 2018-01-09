class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :issue

  validate :user_and_issue_communities_must_match

  def user_and_issue_communities_must_match
    errors.add(:base, 'user and issue communities must match') unless (
      self.user.present? &&
      self.issue.present? &&
      self.user.community.id === self.issue.community.id
    )
  end
end
