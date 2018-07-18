class CreateTheaters < ActiveRecord::Migration[5.2]
  def change
    create_table :theaters do |t|
      t.string :name
      t.integer :zip
      t.text :description
      t.decimal :ticket_price

      t.timestamps
    end
  end
end
