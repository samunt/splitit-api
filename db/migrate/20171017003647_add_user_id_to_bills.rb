class AddUserIdToBills < ActiveRecord::Migration[5.0]
  def change
    add_column :bills, :user_id, :integer
  end
end
