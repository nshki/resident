class InvitesController < ApplicationController
  def sign_up
    @invite = Invite.find_by(code: params[:code])
    redirect_to root_path if @invite.blank?
  end
end
