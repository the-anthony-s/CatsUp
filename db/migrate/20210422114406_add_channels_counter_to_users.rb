class AddChannelsCounterToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :channels_count, :int, default: 0
  end
end
