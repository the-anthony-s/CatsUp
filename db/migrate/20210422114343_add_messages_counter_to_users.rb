class AddMessagesCounterToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :messages_count, :int, default: 0
  end
end
