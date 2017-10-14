class CreateBills < ActiveRecord::Migration[5.0]
  def change
    create_table :bills do |t|
      t.string :title
      t.string :created_by
      t.string :created_at

      t.timestamps
    end
  end
end
