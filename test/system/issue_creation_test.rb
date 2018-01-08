require 'application_system_test_case'

class IssueCreationsTest < ApplicationSystemTestCase
  test 'can successfully create issue' do
    setup_user_and_community
    visit('/issues')
    click_on('New Issue')
    fill_in('Title', with: 'New issue')
    fill_in('Description', with: 'Issue description')
    click_button('Create Issue')
    assert_equal Issue.count, 1
  end

  def setup_user_and_community
    community = create(:community)
    user = create(:user, password: 'password', community: community)
    visit('/sign_in')
    fill_in(:session_email, with: user.email)
    fill_in(:session_password, with: 'password')
    click_button('Sign in')
  end
end
