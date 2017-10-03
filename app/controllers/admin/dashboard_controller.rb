class Admin::DashboardController < ApplicationController

  layout 'admin'

  def index
    @courses = Course.all
  end

end
