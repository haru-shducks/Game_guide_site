class CreateGroupChats < ActiveRecord::Migration[6.1]
  def change
    create_table :group_chats do |t|
      t.integer  :user_id,    null: false
      t.integer  :group_id,   null: false
      t.text     :text,       null: false
      t.timestamps
    end
  end
end
