module ApplicationHelper
  def current_link_name
    "#{controller_name}-#{action_name}"
  end
end
