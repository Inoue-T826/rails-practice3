class RemoveResetSetAtFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :reset_set_at, :datetime
  end
end
