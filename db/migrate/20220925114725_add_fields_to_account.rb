class AddFieldsToAccount < ActiveRecord::Migration[7.0]
  def change
    add_column :accounts, :website, :string
    add_column :accounts, :bio, :text
  end
end
