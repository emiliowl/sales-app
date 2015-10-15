class CreateSaleItems < ActiveRecord::Migration
  def change
    create_table :sale_items do |t|
      t.string :name
      t.decimal :value, precision: 12, scale: 2
      t.references :sale, index: true, foreign_key: true
      t.integer :origin_id
      t.integer :quantity

      t.timestamps null: false
    end
  end
end
