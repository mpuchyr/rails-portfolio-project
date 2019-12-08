class RemoveTimeZoneFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :time_zone
  end
end
