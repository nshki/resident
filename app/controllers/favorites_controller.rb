class FavoritesController < ApplicationController
  before_action :require_login

  def create
    favorite = current_user.favorites.build(favorite_params)
    
    if favorite.save
      redirect_to issue_path(favorite.issue), flash: { success: 'You too. :(' }
    else
      redirect_to issues_path, alert: 'Something went wrong.'
    end
  end

  def destroy
    favorite = current_user.favorites.find_by(id: params[:id])

    if favorite.present?
      issue = favorite.issue
      favorite.destroy
      redirect_to issue_path(issue), flash: { success: 'Not you too. :)' }
    else
      redirect_to issues_path, alert: 'Something went wrong.'
    end
  end

  private

  def favorite_params
    params.require(:favorite).permit(:issue_id)
  end
end
