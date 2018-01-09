class InvitesController < ApplicationController
  def sign_up
    @code = params[:code]
    @invite = Invite.find_by(code: @code)
    redirect_to root_path if @invite.blank?
    @user = User.new
  end

  def create_account
    invite = Invite.find_by(code: params[:user][:code])
    community = Community.find_by(name: ENV.fetch('DEFAULT_COMMUNITY'))
    user = User.new(user_params.merge(community: community))

    if invite.present? && community.present? && user.save
      invite.destroy
      redirect_to root_path, flash: {
        success: 'Account created! Welcome to Resident.'
      }
    else
      redirect_to root_path, alert: 'There was a problem.'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :code)
  end
end
