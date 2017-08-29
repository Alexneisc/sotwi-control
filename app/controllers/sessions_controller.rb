class SessionsController < Clearance::SessionsController
  layout 'sessions'

  protected
  def url_after_create
    if return_to.present?
      return_to
    else
      root_url
    end
  end
end
