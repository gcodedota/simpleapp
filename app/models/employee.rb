class Employee < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader
  belongs_to :organisation
  validates_presence_of :fname, :lname, :email, :birthday, :role, :organisation
  has_secure_password
  validates :password, :presence => true, :confirmation => true, :on => :create
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: true
  enum role: %i[admin employee system]
  enum status: %i[inactivated activated]
  after_initialize :set_default, if: :new_record?

  private
  def set_default
    self.role ||= :employee
    self.status ||= :inactivated
  end
end
