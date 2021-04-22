class AddMessagesCounterToChannels < ActiveRecord::Migration[6.1]
  def change
    add_column :channels, :messages_count, :int, default: 0
  end
end
