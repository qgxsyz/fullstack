class Admin::DashboardController < ApplicationController
  before_action :authenticate_user!
  before_action :require_is_admin
  layout 'admin'

  def index
    params_category = params[:category]

    if params_category == 'basic'
      @courses = Course.basic

    elsif params_category == 'major'
      @courses = Course.major

    elsif params_category == 'optional'
      @courses = Course.optional

    else
      @courses = Course.all
    end
  end

end
