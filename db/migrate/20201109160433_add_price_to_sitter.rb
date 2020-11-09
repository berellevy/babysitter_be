class AddPriceToSitter < ActiveRecord::Migration[6.0]
  def change
    add_column :sitters, :price, :float
  end
end
