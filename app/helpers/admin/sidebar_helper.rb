module Admin::SidebarHelper

  def is_sidebar_active(action_array)
    # "active" if params[:controller].split('/').include?("sections")
    current_action = params[:controller].split('/').last

    "active" if action_array.include?(current_action)
  end

  def is_course_category_active(category)
    "active" if params[:category] == category
  end
end
