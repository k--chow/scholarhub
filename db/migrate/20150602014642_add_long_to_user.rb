class AddLongToUser < ActiveRecord::Migration
  def change
    add_column :users, :long, :decimal, precision: 10, scale: 6
  end
end
