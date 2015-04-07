class CreateCapitals < ActiveRecord::Migration
  def change
    create_table :capitals do |t|
      t.string :type
      t.date :date
      t.decimal :amount

      t.timestamps null: false
    end    
  end
end
