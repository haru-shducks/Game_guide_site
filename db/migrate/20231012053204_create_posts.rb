class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.integer :user_id, null: false
      t.string :title,    null: false
      t.string :content,  null: false

      t.float :salience
    end
  end
end
