class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.string :image_url
      t.decimal :price, precision: 8, scale: 2
      t.text :company
      t.integer :rating, :default =>0
      t.timestamps null: false
    end
  end
end