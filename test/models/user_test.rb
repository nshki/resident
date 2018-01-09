require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'invalid without code' do
    user = build(:user, code: '')
    assert_not user.valid?
  end

  test 'invalid without name' do
    user = build(:user, name: '')
    assert_not user.valid?
  end
end

