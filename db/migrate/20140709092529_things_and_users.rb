class ThingsAndUsers < ActiveRecord::Migration
  def change

    create_table :things do |t|
      t.integer :user_id
      t.string :name
      t.boolean :respectable
      t.boolean :annoying
      t.timestamps
    end
    
    create_table :users do |t|
      t.string :name
      t.timestamps
    end
    
  end
end
