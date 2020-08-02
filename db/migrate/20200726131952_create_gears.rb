class CreateGears < ActiveRecord::Migration[5.2]
  def change
    create_table :gears do |t|
      t.string :name
      t.text :description
      t.string :maker
      t.string :club

      t.timestamps
    end
  end
end
