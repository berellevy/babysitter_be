class ChangeSitterName < ActiveRecord::Migration[6.0]
  def change
    rename_column :sitters, :name, :first_name
    add_column :sitters, :last_name, :string, null: false
    add_column :sitters, :available, :boolean, null: false, default: true
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
