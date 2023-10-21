class CreateGroups < ActiveRecord::Migration[6.1]
  def change
    create_table :groups do |t|
      t.integer :leader_id, null: false
      t.string :name, null: false
      t.timestamps
    end
  end
end
