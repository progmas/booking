class AddLockVersionToEvents < ActiveRecord::Migration[8.0]
  def change
    add_column :events, :lock_version, :integer
  end
end
