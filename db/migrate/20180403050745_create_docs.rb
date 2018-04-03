class CreateDocs < ActiveRecord::Migration[5.1]
  def change
    create_table :docs do |t|
      t.references :client, foreign_key: true
      t.string :number
      t.text :description
      t.integer :price

      t.timestamps
    end
  end
end
