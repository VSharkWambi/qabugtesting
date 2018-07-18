class CreatePurchases < ActiveRecord::Migration[5.2]
  def change
    create_table :purchases do |t|
      t.references :user, foreign_key: true
      t.references :showtime, foreign_key: true
      t.integer :num_tickets

      t.timestamps
    end
  end
end
