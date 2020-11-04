class CreateAvailabilities < ActiveRecord::Migration[6.0]
  def change
    create_table :availabilities do |t|
      t.references :sitter, null: false, foreign_key: true
      t.time :start
      t.time :end
      t.integer :weekday

      t.timestamps
    end
  end
end
