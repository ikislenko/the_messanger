class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.references :commentable, polymorphic: true
      t.references :user, foreign_key: true
      t.text :content, null: false
      t.integer :parent_id

      t.timestamps
    end
  end
end
