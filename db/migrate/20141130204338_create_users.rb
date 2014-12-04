class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users, :id => false do |t|
      t.integer :id, :limit => 8

      t.string :name
      t.string :surname
      t.string :phone
      t.string :location

      t.timestamps
    end

    add_index "users", ["id"], name: "index_users_on_id", unique: true, using: :btree
  end
end
