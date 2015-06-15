class AddBooleansForToUsers < ActiveRecord::Migration
  def change
    add_column :users, :student, :boolean
    add_column :users, :tutor, :boolean
    change_column :users, :both, :boolean, :default => :student && :tutor
  end
end
