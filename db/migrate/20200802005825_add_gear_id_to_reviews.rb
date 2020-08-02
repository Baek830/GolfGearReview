class AddGearIdToReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :gear_id, :integer
  end
end
