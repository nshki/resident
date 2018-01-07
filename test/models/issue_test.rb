require 'test_helper'

class IssueTest < ActiveSupport::TestCase
  test 'valid issue' do
    issue = build(:issue)
    assert issue.valid?
  end

  test 'invalid without title' do
    issue = build(:issue, title: '')
    assert_not issue.valid?
  end

  test 'invalid without description' do
    issue = build(:issue, description: '')
    assert_not issue.valid?
  end
end
