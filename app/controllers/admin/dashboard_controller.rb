class Admin::DashboardController < ApplicationController

  layout 'admin'

  def show
    @courses = Course.all
  end
end
