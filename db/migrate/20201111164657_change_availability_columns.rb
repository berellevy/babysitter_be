class ChangeAvailabilityColumns < ActiveRecord::Migration[6.0]
  def change
    rename_column :availabilities, :start, :start_time
    rename_column :availabilities, :end, :end_time
  end
end
