class CreateTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :transactions do |t|
      t.string :description
      t.decimal :withdrawls
      t.decimal :deposits
      t.decimal :balance

      t.timestamps
    end
  end
end
