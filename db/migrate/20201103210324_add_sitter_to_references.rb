class AddSitterToReferences < ActiveRecord::Migration[6.0]
  def change
    add_reference :references, :sitter, null: false, foreign_key: true
  end
end
