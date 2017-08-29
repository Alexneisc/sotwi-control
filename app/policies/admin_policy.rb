class AdminPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def method_missing(name, *args)
    if name.to_s.last == '?'
      admin?
    else
      super
    end
  end

  private

  def admin?
    user.admin? || user.have_role?(:admin)
  end
end
