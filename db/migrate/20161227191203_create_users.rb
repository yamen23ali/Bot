class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :messenger_id
      t.text :data

      t.timestamps null: false
    end
  end
end
