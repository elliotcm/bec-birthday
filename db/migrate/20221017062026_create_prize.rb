class CreatePrize < ActiveRecord::Migration[7.0]
  def change
    create_table :prizes do |t|
      t.string :value, null: false
      t.integer :order

      t.boolean :revealed, default: false

      t.boolean :chosen, default: false
      t.boolean :rejected, default: false

      t.timestamps
    end
  end
end
