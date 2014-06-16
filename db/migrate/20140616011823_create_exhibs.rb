class CreateExhibs < ActiveRecord::Migration
  def change
    create_table :exhibs do |t|
      t.string :title
      t.string :og
      t.text :discription
      t.string :gallery
      t.string :adress
      t.date :start_at
      t.date :end_at

      t.timestamps
    end
  end
end
