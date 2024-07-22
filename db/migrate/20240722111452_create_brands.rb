class CreateBrands < ActiveRecord::Migration[7.1]
  def change
    create_table :brands do |t|
      t.string :name, null: false
      t.integer :foundation_year
      t.string :country
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
