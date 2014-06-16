class CreateSculptures < ActiveRecord::Migration
  def change
    create_table :sculptures do |t|
      t.string :title
      t.integer :wide
      t.integer :dipth
      t.integer :high
      t.date :madedate
      t.integer :categoryno

      t.timestamps
    end
  end
end
