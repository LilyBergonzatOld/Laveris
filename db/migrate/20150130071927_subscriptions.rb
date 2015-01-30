class Subscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions, :id => false do |t|
      t.references :user, index: true
      t.references :event, index: true
    end
  end
end
