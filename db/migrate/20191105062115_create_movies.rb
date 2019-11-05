class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :name, :limit => 80
      t.string :year, :limit => 4
      t.string :director, :limit => 60
      t.string :main_star, :limit => 60
      t.text :description, :limit => 400
      t.integer :favorited_by_users, default: 0
      t.integer :created_by

      t.timestamps
    end
  end
end
