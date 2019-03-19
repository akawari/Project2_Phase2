class CreateAssignments < ActiveRecord::Migration[5.2]
  def change
    create_table :assignments do |t|
      t.integer :store_id
      t.integer :employee_id
      t.date :start_date
      t.date :end_date
      t.string :pay_level_integer

      t.timestamps
    end
  end
end
