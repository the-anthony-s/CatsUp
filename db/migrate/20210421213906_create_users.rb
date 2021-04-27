class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name, index: true
      t.string :email, index: true

      t.timestamps
    end
  end
end
