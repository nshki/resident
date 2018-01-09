require 'application_system_test_case'

class CommentingTest < ApplicationSystemTestCase
  test 'can successfully post comment' do
    login_and_create_issue
    visit("/issues/#{Issue.first.id}")
    fill_in('comment[message]', with: 'Help me.')
    click_button('Post')
    assert_text('Help me.')
  end

  def login_and_create_issue
    user = create(:user, password: 'password')
    visit('/sign_in')
    fill_in('Email', with: user.email)
    fill_in('Password', with: 'password')
    click_button('Sign in')
    create(:issue, user: user, community: user.community)
  end
end
