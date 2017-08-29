class ApplicationController < ActionController::Base
  include Clearance::Controller
  include Pundit

  protect_from_forgery with: :exception

  before_action :require_login

  private

  def records_per_page
    25
  end

  def require_admin
    return if current_user&.admin?
    redirect_to(
      :root,
      flash: {
        error: 'Нет доступа к этому разделу'
      }
    )
  end
end
