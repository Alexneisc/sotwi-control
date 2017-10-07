module ApplicationHelper
  def current_link_name
    "#{controller_name}-#{action_name}"
  end

  def icon_boolean(boolean)
    boolean ? '<i class="fa fa-check"></i>'.html_safe : ''
  end
end
