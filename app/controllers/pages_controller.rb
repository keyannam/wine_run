class PagesController < ApplicationController
  def home
    if current_user
      redirect_to wines_path
    end
  end
end
