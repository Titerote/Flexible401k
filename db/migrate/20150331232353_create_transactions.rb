class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.string :type
      t.date :date
      t.text :description
      t.decimal :price
      t.decimal :units
      t.decimal :amount

      t.timestamps null: false
    end
  end
end
