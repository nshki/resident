require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'invalid without code' do
    user = build(:user, code: '')
    assert_not user.valid?
  end
end

