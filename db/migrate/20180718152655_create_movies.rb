class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.string :name
      t.integer :running_time
      t.integer :rating
      t.text :description

      t.timestamps
    end
  end
end
