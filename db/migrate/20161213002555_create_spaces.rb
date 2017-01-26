class CreateSpaces < ActiveRecord::Migration
  def change
    create_table :spaces do |t|
      t.string :name, null: false
      t.string :address, null: false
      t.string :mail_address
      t.string :tel
      t.integer :member_limit, null: false
      t.integer :charge, null: false
      t.integer :min_time_block, default: 0
      t.integer :max_time_block, default: 0
      t.integer :start_time_block, default: 0
      t.integer :finish_time_block, default: 0
      t.string :description
      t.integer :cancellation_charge, default: 0
      t.integer :space_type, null: false

      t.boolean :visible, null: false, default: true
      t.boolean :authorized, null: false, default: false
      t.timestamps null: false

      t.references :user, foreign_key: true
    end
  end
end
