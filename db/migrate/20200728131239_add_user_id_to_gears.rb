class AddUserIdToGears < ActiveRecord::Migration[5.2]
  def change
    add_column :gears, :user_id, :integer
  end
end
