class CreateSaveds < ActiveRecord::Migration[7.0]
  def change
    create_table :saveds do |t|
      t.references :post, null: false, foreign_key: true
      t.references :account, null: false, foreign_key: true

      t.timestamps
    end
  end
end
