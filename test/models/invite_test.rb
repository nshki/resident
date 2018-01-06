require 'test_helper'

class InviteTest < ActiveSupport::TestCase
  test 'valid with code' do
    invite = build(:invite)
    assert invite.valid?
  end

  test 'invalid without code' do
    invite = build(:invite, code: '')
    assert !invite.valid?
  end

  test 'invalid if not unique' do
    invite1 = create(:invite, code: 'sheep')
    invite2 = build(:invite, code: 'sheep')
    assert !invite2.valid?
  end
end
