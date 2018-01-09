require 'application_system_test_case'

class FavoritingTest < ApplicationSystemTestCase
  test 'favoriting shows unfavorite button' do
    login_and_create_issue
    visit("/issues/#{Issue.first.id}")
    click_on('Me too :(')
    assert_text('Not me too :)')
  end

  test 'unfavoriting shows favorite button' do
    login_and_create_issue
    create(:favorite, user: User.first, issue: Issue.first)
    visit("/issues/#{Issue.first.id}")
    click_on('Not me too :)')
    assert has_button?('Me too :(')
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
