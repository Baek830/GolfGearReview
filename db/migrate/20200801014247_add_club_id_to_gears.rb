class AddClubIdToGears < ActiveRecord::Migration[5.2]
  def change
    add_column :gears, :club_id, :integer
  end
end
