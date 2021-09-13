class CreateReceiptDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :receipt_details do |t|
      t.references :receipt, null: false, foreign_key: true
      t.references :room, null: false, foreign_key: true
      t.datetime :from_time
      t.datetime :end_time
      t.integer :amount_of_people, default: 0
      t.decimal :into_money

      t.timestamps
    end
  end
end
