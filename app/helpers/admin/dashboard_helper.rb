module Admin::DashboardHelper
  # 课程是否锁定
  def render_course_is_locked(course)
    if course.is_locked
      content_tag(:span, "锁定", :class => "fa fa-lock")
    else
      content_tag(:span, "开放", :class => "fa fa-globe")
    end
  end

  # 课程属性
  def render_course_category(category)
    # ['basic', 'major', 'optional']
    case category
    when 'basic'
      '开学前必做'
    when 'major'
      '主修课程'
    when 'optional'
      '选修课程'
    else
      ''
    end
  end

end
