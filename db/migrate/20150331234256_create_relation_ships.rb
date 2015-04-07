class CreateRelationShips < ActiveRecord::Migration
  def change
    create_table :capitals_transactions, id: false do |t|
      t.belongs_to :capitals, index: true
      t.belongs_to :transactions, index: true
    end
    
    create_table :transactions_share_packages, id: false do |t|
      t.belongs_to :share_packages, index: true
      t.belongs_to :transactions, index: true
    end

  end
end
