class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:dashboard]

  def home
    if current_user
      redirect_to wines_path
    end
  end

  def dashboard
    @wines = current_user.wines
  end
end
