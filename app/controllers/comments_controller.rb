class CommentsController < ApplicationController
  before_action :require_login

  def create
    comment = current_user.comments.build(comment_params)
    
    if comment.save
      redirect_to issue_path(comment.issue), flash: { success: 'Comment posted!' }
    else
      redirect_to issues_path, alert: 'Something went wrong.'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:message, :issue_id)
  end
end
