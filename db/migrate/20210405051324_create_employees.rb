class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.belongs_to :organisation, index: true, foreign_key: true
      t.string :fname
      t.string :lname
      t.string :email
      t.text :password
      t.date :birthday
      t.integer :role

      t.timestamps null: false
    end
  end
end
