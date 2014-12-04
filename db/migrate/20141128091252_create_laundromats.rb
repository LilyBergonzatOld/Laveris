class CreateLaundromats < ActiveRecord::Migration
  def change
    create_table :laundromats do |t|
      t.string :name
      t.integer :capacity
      t.string :phone
      t.string :nbstreet
      t.string :libstreet
      t.string :zipcode
      t.string :libcity

      t.timestamps
    end
  end
end
