class Employee < ActiveRecord::Base
  belongs_to :organisation
  validates_presence_of :fname, :lname, :email, :birthday, :role, :organisation, :password
  has_secure_password
  validates :password, length: { minimum: 5 }
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: true
  enum role: %i[admin employee]
  after_initialize :set_default_role, if: :new_record?

  def set_default_role
    self.role ||= :employee
  end
end
