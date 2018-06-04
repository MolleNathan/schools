class CreateTableSchools < ActiveRecord::Migration[5.1]
  def change
    create_table :schools do |t|
      t.timestamps
      t.string :name
      t.string :adress
      t.string :zip_code
      t.string :city
      t.string :schedule
      t.string :phone_number
      t.string :email
      t.float :latitude
      t.float :longitude
      t.integer :nb_student
      t.string :type

    end
  end
end
