class CreateReservationOptions < ActiveRecord::Migration[5.0]
  def change
    create_table :reservation_options do |t|
      t.references :reservation, foreign_key: true
      t.references :option, foreign_key: true
      t.timestamps
    end
  end
end
