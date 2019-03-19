class CreateStores < ActiveRecord::Migration[5.2]
  def change
    create_table :stores do |t|
      t.string :name
      t.string :street
      t.string :city
      t.string :state
      t.string :zip
      t.string :phone
      t.float :longitude
      t.float :latitude
      t.boolean :active

      t.timestamps
    end
  end
end
