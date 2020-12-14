class AddApprovedToSittersAndCleanUp < ActiveRecord::Migration[6.0]
  def change
    remove_column :sitters, :google_token
    remove_column :sitters, :google_refresh_token
    add_column :sitters, :approved, :boolean, default: false
  end
end
