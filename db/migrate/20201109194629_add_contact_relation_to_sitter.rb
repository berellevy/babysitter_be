class AddContactRelationToSitter < ActiveRecord::Migration[6.0]
  def change
    add_column :sitters, :contact_relation, :string
  end
end
