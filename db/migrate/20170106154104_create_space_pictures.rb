class CreateSpacePictures < ActiveRecord::Migration
  def change
    create_table :space_pictures do |t|
      t.string :image_path
      t.timestamps null: false
    end
  end
end