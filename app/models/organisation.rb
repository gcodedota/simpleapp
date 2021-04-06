class Organisation < ActiveRecord::Base
  mount_uploader :logo, AvatarUploader
  has_many :employees, dependent: :destroy
  validates :name, uniqueness: true
end
