class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def require_is_admin
    if !current_user.admin?
      flash[:alert] = '只有管理员才可进入，你想干啥？'
      redirect_to root_path
    end
  end

  def require_is_admin
    if !current_user.admin?
      flash[:alert] = '只有管理员才可进入，你想干啥？'
      redirect_to root_path
    end
  end

  # routing_error 方案 1
  rescue_from ActionController::RoutingError do |exception|
    render :template => "error/404/index.html.erb"
  end

  def routing_error
    raise ActionController::RoutingError.new(params[:path])
  end

  # routing_error 方案 2
  #rescue_from ActionController::RoutingError, :with => :render_not_found
  # def render_not_found
  #   render :template => "error/404/index.html.erb"
  # end
end
