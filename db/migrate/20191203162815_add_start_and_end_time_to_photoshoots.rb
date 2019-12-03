class AddStartAndEndTimeToPhotoshoots < ActiveRecord::Migration[6.0]
  def change
    add_column :photoshoots, :start_time, :datetime
    add_column :photoshoots, :end_time, :datetime
  end
end
