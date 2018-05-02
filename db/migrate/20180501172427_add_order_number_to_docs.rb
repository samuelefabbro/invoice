class AddOrderNumberToDocs < ActiveRecord::Migration[5.1]
  def change
    add_column :docs, :order_number, :string
  end
end
