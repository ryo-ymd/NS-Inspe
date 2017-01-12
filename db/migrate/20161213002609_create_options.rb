class CreateOptions < ActiveRecord::Migration
  def change
    create_table :options do |t|
      t.string :option_name, null: false
      t.boolean :standard_option, null: false, default: true
      t.string :count, null: false, default: 1
      t.integer :charge, null: false, default: 0
      t.string :remark
      t.references :space, foreign_key: true
      t.timestamps null: false
    end
  end
end
