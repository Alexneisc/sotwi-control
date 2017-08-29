class User < ApplicationRecord
  include Clearance::User

  ROLES = {
    admin: 'Админ'.freeze,
  }.freeze

  validates :username, presence: true, uniqueness: true

  def self.authenticate(email, password)
    user = where('lower(username) = ?', email.to_s.downcase).first
    user&.authenticated?(password) ? user : nil
  end

  def roles=(roles)
    roles_normalized = if roles.is_a? String
      roles.gsub(' ', '').split(',')
    else
      roles.reject { |role| role.blank? }
    end
    super(roles_normalized)
  end

  def have_role?(role)
    roles&.include?(role.to_s)
  end

  private

  def email_optional?
    true
  end
end
