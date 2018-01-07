class InvitesController < ApplicationController
  def sign_up
    @code = params[:code]
    @invite = Invite.find_by(code: @code)
    redirect_to root_path if @invite.blank?
    @user = User.new
  end

  def create_account
    user = User.new(user_params)
    invite = Invite.find_by(code: user.code)

    if invite.present? && user.save
      invite.destroy
      redirect_to root_path, success: 'Account created! Welcome to Resident.'
    else
      redirect_to root_path, error: 'There was a problem.'
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :code)
  end
end
