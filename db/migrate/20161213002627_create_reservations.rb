class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.references :user, foreign_key: true
      t.string :start_time_block, null: false
      t.string :end_time_block, null: false
      t.string :block_modify, null: false
      t.references :space, foreign_key: true
      t.date :date, null: false
      t.timestamps null: false
    end
  end
end
