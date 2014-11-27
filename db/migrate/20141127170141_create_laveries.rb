class CreateLaveries < ActiveRecord::Migration
  def change
    create_table :laveries do |t|
      t.integer :laverie_id
      t.string :name
      t.string :nbmaxpers
      t.string :numtel
      t.string :numrue
      t.string :librue
      t.string :cdpost
      t.string :libville

      t.timestamps
    end
  end
end
