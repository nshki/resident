class IssuesController < ApplicationController
  before_action :require_login

  def index
    @issues = current_user.community.issues.order(created_at: :desc)
  end

  def new
    @issue = Issue.new
  end

  def create
    @issue = Issue.new(issue_params.merge(
      community: current_user.community,
      user: current_user,
    ))

    if @issue.save
      redirect_to issues_path, flash: { success: 'Issue created.' }
    else
      render :new
    end
  end

  def show
    @issue = current_user.community.issues.find_by(id: params[:id])
    redirect_to issues_path if @issue.blank?
    @favorite = Favorite.find_by(user: current_user, issue: @issue)
    @favorite = Favorite.new if @favorite.blank?
  end

  private

  def issue_params
    params.require(:issue).permit(:title, :description)
  end
end
