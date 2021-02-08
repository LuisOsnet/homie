class CreateProperties < ActiveRecord::Migration[6.1]
  def change
    create_table :properties do |t|
      t.string :name
      t.string :description
      t.decimal :price, precision: 10, scale: 2
      t.integer :status, default: 0
      t.string :owner_name
      t.string :owner_phone

      t.timestamps
    end
  end
end