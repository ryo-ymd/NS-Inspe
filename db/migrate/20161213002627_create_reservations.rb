class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.references :user, foreign_key: true
      t.integer :start_time_block, null: false
      t.integer :end_time_block, null: false
      t.string :block_modify
      t.references :space, foreign_key: true
      t.date :date, null: false
      t.timestamps null: false
    end
  end
end
