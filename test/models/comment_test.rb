require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  test 'valid comment' do
    user = create(:user)
    issue = create(:issue, user: user, community: user.community)
    comment = build(:comment, issue: issue, user: user)
    assert comment.valid?
  end

  test 'invalid without message' do
    user = create(:user)
    issue = create(:issue, user: user, community: user.community)
    comment = build(:comment, message: '', issue: issue, user: user)
    assert_not comment.valid?
  end

  test 'invalid without issue in user community' do
    user = create(:user)
    issue = create(:issue, user: create(:user, email: 'a@b.com'))
    comment = build(:comment, issue: issue, user: user)
    assert_not comment.valid?
  end
end
