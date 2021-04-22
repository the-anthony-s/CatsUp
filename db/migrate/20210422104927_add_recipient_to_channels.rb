class AddRecipientToChannels < ActiveRecord::Migration[6.1]
  def change
    add_column :channels, :recipient_id, :integer, index: true
    add_foreign_key :channels, :users, column: :recipient_id
  end
end
