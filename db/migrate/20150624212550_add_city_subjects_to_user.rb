class AddCitySubjectsToUser < ActiveRecord::Migration
  def change
  	add_column :users, :city, :string
  	add_column :users, :sSubjects, :string
  	add_column :users, :tSubjects, :string
  end
end
