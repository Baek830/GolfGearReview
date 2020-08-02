class AddMakerIdToGears < ActiveRecord::Migration[5.2]
  def change
    add_column :gears, :maker_id, :integer
  end
end
