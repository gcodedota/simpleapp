class AddStatusToEmployees < ActiveRecord::Migration
  def change
    add_column :employees, :status, :int
  end
end
