class IssuesControllerTest < ActionDispatch::IntegrationTest
  test 'cannot view other community issues' do
    user = create(:user, password: 'password')
    other_community = create(:community, name: 'Other Community')
    other_user = create(:user, email: 'a@b.com', community: other_community)
    issue = create(:issue, community: other_community, user: other_user)
    post(session_path(session: { email: user.email, password: 'password' }))
    get(issue_path(issue))
    assert :redirect
  end
end
