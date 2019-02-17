class AddColumnsGuestUserIdToRoom < ActiveRecord::Migration[5.2]
  def change
    add_column :rooms, :guest_user_id, :integer
  end
end
