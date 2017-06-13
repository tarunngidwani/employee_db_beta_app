class CreateEmployees < ActiveRecord::Migration[5.1]
  def change
    create_table :employees do |t|
      t.string :name
      t.integer :house_num
      t.string :street_name
      t.string :city
      t.belongs_to :state, foreign_key: true
      t.string :zip_code

      t.timestamps
    end
  end
end
