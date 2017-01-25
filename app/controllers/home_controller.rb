class HomeController < ApplicationController
  def show
    redirect_to posts_path if current_user
  end
end
