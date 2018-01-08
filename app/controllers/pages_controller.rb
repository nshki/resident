class PagesController < ApplicationController
  def home
    if signed_in?
      redirect_to issues_path
    end
  end
end
