class CreateScholars < ActiveRecord::Migration
  def change
    create_table :scholars do |t|
      t.string :name
      t.string :email
      t.string :school

      t.timestamps null: false
    end
  end
end
