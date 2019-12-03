class CreatePhotoshoots < ActiveRecord::Migration[6.0]
  def change
    create_table :photoshoots do |t|
      t.integer :user_id
      t.integer :location_id
      t.text :comments

      t.timestamps
    end
  end
end
