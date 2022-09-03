class CreateFurimas < ActiveRecord::Migration[6.0]
  def change
    create_table :furimas do |t|
      t.string :user
      t.string :product
      t.string :purchase
      t.string :send

      t.timestamps
    end
  end
end
