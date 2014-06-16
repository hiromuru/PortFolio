class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :name
      t.text :history
      t.text :exhistory
      t.integer :admin_user_id

      t.timestamps
    end
  end
end
