class ChangeAvailabilitiesTimeStructure < ActiveRecord::Migration[6.0]
  def change
    remove_column :availabilities, :end_time
    add_column :availabilities, :duration_minutes, :integer, null: false, default: 60
  end
end
