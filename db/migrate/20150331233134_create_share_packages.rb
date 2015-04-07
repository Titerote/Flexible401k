class CreateSharePackages < ActiveRecord::Migration
  def change
    create_table :share_packages do |t|
      t.belongs_to :mutual_fund, index: true
      t.date :fact_date
      t.decimal :price
      t.decimal :units
      t.decimal :market_value

      t.timestamps null: false
    end
  end
end
