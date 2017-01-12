class CreateSpaces < ActiveRecord::Migration
  def change
    create_table :spaces do |t|
      t.string :name, null: false
      t.integer :prefecture_code, null: false
      t.string :address, null: false
      t.string :mail_address
      t.string :tel
      t.integer :member_limit, null: false
      t.integer :charge, null: false
      t.string :min_time_block
      t.string :max_time_block
      t.string :start_time_block
      t.string :finish_time_block
      t.string :description
      t.integer :cancellation_charge, default: 0
      t.integer :space_type, null: false
      t.references :owner_id, foreign_key: true
      t.boolean :visible, null: false, default: true
      t.boolean :authorize, null: false, default: true
      # t.boolean :authorize, null :false, default :false
      t.timestamps null: false
    end
  end
end
