class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :mail, null: false
      t.string :name, null: false
      t.integer :member_type, null: false
      t.string :password_digest, null: false
      t.string :image
      t.boolean :admin, null: false, default: false

      t.timestamps null: false
    end
  end
end
