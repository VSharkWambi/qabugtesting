class CreateShowtimes < ActiveRecord::Migration[5.2]
  def change
    create_table :showtimes do |t|
      t.references :movie, foreign_key: true
      t.references :theater, foreign_key: true
      t.string :time
      t.integer :seats_available
      t.integer :tickets_sold

      t.timestamps
    end
  end
end
