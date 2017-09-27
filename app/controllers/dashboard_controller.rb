class DashboardController < ApplicationController

  def index
    @courses = Course.all
  end

end
