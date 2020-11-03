class CreateSitters < ActiveRecord::Migration[6.0]
  def change
    create_table :sitters do |t|
      t.string :name
      t.datetime :birthday
      t.integer :years_of_experience
      t.text :bio
      t.string :contact_name
      t.string :contact_phone

      t.timestamps
    end
  end
end
