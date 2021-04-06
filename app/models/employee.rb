class Employee < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader
  belongs_to :organisation
  validates_presence_of :fname, :lname, :email, :birthday, :role, :organisation, :password
  has_secure_password
  validates :password, length: { minimum: 5 }
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: true
  enum role: %i[admin employee system]
  after_initialize :set_default_role, if: :new_record?

  private
  def set_default_role
    self.role ||= :employee
  end
end
