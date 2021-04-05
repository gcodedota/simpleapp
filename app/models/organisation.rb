class Organisation < ActiveRecord::Base
  has_many :employees, dependent: :destroy
  validates :name, uniqueness: true
end
