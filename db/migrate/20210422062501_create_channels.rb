class CreateChannels < ActiveRecord::Migration[6.1]
  def change
    create_table :channels do |t|
      t.string :name, index: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
