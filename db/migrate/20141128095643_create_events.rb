class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.datetime :date
      t.references :user, index: true
      t.references :laundromat, index: true

      t.timestamps
    end
  end
end
