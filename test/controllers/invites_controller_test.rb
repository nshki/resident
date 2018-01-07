class InvitesControllerTest < ActionDispatch::IntegrationTest
  test 'invite path does not exist without valid code' do
    get('/invite/invalid_code')
    assert :redirect
  end
end
