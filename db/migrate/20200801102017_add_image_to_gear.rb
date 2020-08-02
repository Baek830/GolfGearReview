class AddImageToGear < ActiveRecord::Migration[5.2]
  def change
    add_column :gears, :image, :string
  end
end
