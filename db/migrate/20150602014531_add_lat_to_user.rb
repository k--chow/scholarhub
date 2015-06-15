class AddLatToUser < ActiveRecord::Migration
  def change
    add_column :users, :lat, :decimal, {:precision=>10, :scale=>6}
  end
end
