class ChangeUserBoth < ActiveRecord::Migration
  def change
  	change_column :users, :both, :boolean, :default => :student && :tutor
  end
end
