class CreateParks < ActiveRecord::Migration[6.0]
  def change
    create_table :parks do |t|
      t.string :name,                     null: false
      t.integer :prefecture_id,           null: false
      t.string :address
      t.string :opening_hours
      t.boolean :parking,                 null: false, default: false
      t.boolean :vending_machine,         null: false, default: false
      t.boolean :hand_wash,               null: false, default: false
      t.boolean :toilet,                 null: false, default: false
      t.boolean :breastfeeding_room,      null: false, default: false
      t.boolean :diaper_changing_table,   null: false, default: false
      t.boolean :play_set,                null: false, default: false
      t.boolean :sandbox,                 null: false, default: false
      t.boolean :grass,                   null: false, default: false
      t.boolean :kick_bike,               null: false, default: false
      t.boolean :store,                   null: false, default: false
      t.boolean :restaurant,              null: false, default: false
      t.references :user,                 null: false, foreign_key: true 
      t.timestamps
    end
  end
end
