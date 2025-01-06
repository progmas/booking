class CreateTickets < ActiveRecord::Migration[8.0]
  def change
    create_table :tickets do |t|
      t.references :event, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.integer :quantity, null: false

      t.timestamps
    end
  end
end
