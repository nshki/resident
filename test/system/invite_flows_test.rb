require 'application_system_test_case'

class InviteFlowsTest < ApplicationSystemTestCase
  test 'signing up destroys invite instance' do
    invite = create(:invite)
    code = invite.code
    visit("/invite/#{code}")
    fill_in('Email', with: 'chuck@testa.com')
    fill_in('Password', with: 'Alskdjfhg1!')
    click_button('Create Account')
    assert_nil Invite.find_by(code: code)
  end
end
