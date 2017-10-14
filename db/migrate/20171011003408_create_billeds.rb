class CreateBilleds < ActiveRecord::Migration[5.0]
  def change
    create_table :billeds do |t|
      t.string :firstName
      t.string :lastName
      t.boolean :onNetwork
      t.references :bill, foreign_key: true

      t.timestamps
    end
  end
end
