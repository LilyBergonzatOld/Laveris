class UpdateEvents < ActiveRecord::Migration
  def change
    change_table :events do |t|
      t.string :name
      t.string :message
      remove_column :events, :date, :datetime
      add_column :events, :date, :datetime, index: true
    end
  end
end
