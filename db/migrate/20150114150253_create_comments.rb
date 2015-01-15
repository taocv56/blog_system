class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :content
      t.references :user, index: true
      t.references :micropost, index: true

      t.timestamps null: false
    end
    add_index :comments, [:user_id, :micropost_id, :created_at]
  end
end
