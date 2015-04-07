class CreateMutualFunds < ActiveRecord::Migration
  def change
    create_table :mutual_funds do |t|
      t.belongs_to :fund_type, index: true
      t.string :name
      t.text :description

      t.timestamps null: false
    end
  end
end
