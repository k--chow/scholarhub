class AddBooleansForToUsers < ActiveRecord::Migration
  def change
    add_column :users, :student, :boolean
    add_column :users, :tutor, :boolean
    add_column :users, :both, :boolean
end
