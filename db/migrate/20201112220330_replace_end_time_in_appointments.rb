class ReplaceEndTimeInAppointments < ActiveRecord::Migration[6.0]
  def change
    remove_column :appointments, :end_time
    add_column :appointments, :duration_minutes, :integer, null: false, default: 60
  end
end
