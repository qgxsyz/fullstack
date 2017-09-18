module Admin::DashboardHelper
  # 课程是否锁定
  def render_course_is_locked(course)
    if course.is_locked
      content_tag(:span, "锁定", :class => "fa fa-lock")
    else
      content_tag(:span, "开放", :class => "fa fa-globe")
    end
  end
end
