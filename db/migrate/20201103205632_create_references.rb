class CreateReferences < ActiveRecord::Migration[6.0]
  def change
    create_table :references do |t|
      t.string :name
      t.string :phone
      t.string :relationship

      t.timestamps
    end
  end
end
