require 'test_helper'

class CommunityTest < ActiveSupport::TestCase
  test 'valid community' do
    community = build(:community)
    assert community.valid?
  end

  test 'invalid without name' do
    community = build(:community, name: '')
    assert_not community.valid?
  end
end
