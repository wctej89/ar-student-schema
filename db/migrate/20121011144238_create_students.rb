require_relative '../config'

# this is where you should use an ActiveRecord migration to 

class CreateStudents < ActiveRecord::Migration
  def change
    # HINT: checkout ActiveRecord::Migration.create_table
  create_table :students do |column|
    column.integer  :id
    column.string   :first_name
    column.string   :last_name
    column.string   :gender
    column.date     :birthday
    column.string   :email
    column.string   :phone
    end
  end
end
