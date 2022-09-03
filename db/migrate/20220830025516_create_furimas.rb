class CreateFurimas < ActiveRecord::Migration[6.0]
  def change
    create_table :furimas do |t|
      t.string :user
      t.string :product
      t.string :send
      t.string :record
      t.references :user, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.references :record, null: false, foreign_key: true


      t.timestamps
    end
  end
end
