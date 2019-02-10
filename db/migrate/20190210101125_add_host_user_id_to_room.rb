class AddHostUserIdToRoom < ActiveRecord::Migration[5.2]
  def change
    add_column :rooms, :host_user_id, :integer
  end
end
