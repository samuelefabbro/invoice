class AddDateToDocs < ActiveRecord::Migration[5.1]
  def change
    add_column :docs, :date, :string
    add_column :docs, :payment, :string
    add_column :docs, :deadline, :string
  end
end
