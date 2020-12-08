class AddAuthToSitter < ActiveRecord::Migration[6.0]
  def change
    change_table :sitters do |t|
      t.string :provider, null: false
      t.string :uid, null: false
      t.string :access_token, null: false
      t.datetime :access_token_date, null: false
      t.index ["access_token"], name: "index_sitters_on_access_token"
      t.index ["uid"], name: "index_sitters_on_uid"
    end

  end
end
