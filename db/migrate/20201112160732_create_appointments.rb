class CreateAppointments < ActiveRecord::Migration[6.0]
  def change
    create_table :appointments do |t|
      t.references :sitter, null: false, foreign_key: true
      t.datetime :start_time, null: false
      t.datetime :end_time, null: false
      t.string :title
      t.text :note
      t.string :contact_name
      t.string :contact_phone
      t.string :location

      t.timestamps
    end
  end
end