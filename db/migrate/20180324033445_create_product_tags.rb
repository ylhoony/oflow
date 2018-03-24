class CreateProductTags < ActiveRecord::Migration[5.1]
  def change
    create_table :product_tags do |t|
      t.integer :product_id
      t.integer :tag_id

      t.timestamps null: false
    end
  end
end
