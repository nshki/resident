require 'test_helper'

class InviteFlowTest < ActionDispatch::IntegrationTest
  test 'invite path does not exist without valid code' do
    get '/invite/invalid_code'
    assert :redirect
  end

  test 'invite path exists with valid code' do
    invite = create(:invite)
    get "/invite/#{invite.code}"
    assert :success
  end
end
