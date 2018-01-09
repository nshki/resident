require 'test_helper'

class FavoriteTest < ActiveSupport::TestCase
  test 'valid favorite' do
    user = create(:user)
    issue = create(:issue, user: user, community: user.community)
    favorite = build(:favorite, issue: issue, user: user)
    assert favorite.valid?
  end

  test 'invalid without issue in user community' do
    user = create(:user)
    issue = create(:issue, user: create(:user, email: 'a@b.com'))
    favorite = build(:favorite, issue: issue, user: user)
    assert_not favorite.valid?
  end
end
