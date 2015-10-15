class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.date :date
      t.decimal :value

      t.timestamps null: false
    end
  end
end
