class CreateShiritoriMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :shiritori_messages do |t|
      t.integer :user_id
      t.string :body

      t.timestamps
    end
  end
end
