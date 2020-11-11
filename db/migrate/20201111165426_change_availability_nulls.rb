class ChangeAvailabilityNulls < ActiveRecord::Migration[6.0]
  def change
    change_column_null :availabilities, :weekday, false
    change_column_null :availabilities, :start_time, false
    change_column_null :availabilities, :end_time, false
  end
end
