class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :content
      t.references :account, null: false, foreign_key: true
      t.string :account
      
      t.timestamps
    end
  end
end
