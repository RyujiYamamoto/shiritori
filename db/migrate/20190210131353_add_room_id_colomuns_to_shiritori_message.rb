class AddRoomIdColomunsToShiritoriMessage < ActiveRecord::Migration[5.2]
  def change
    add_column :shiritori_messages, :room_id, :integer
  end
end
