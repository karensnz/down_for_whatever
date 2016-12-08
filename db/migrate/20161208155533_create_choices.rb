class CreateChoices < ActiveRecord::Migration
  def change
    create_table :choices do |t|
      t.integer :event_id
      t.string :location
      t.string :address
      t.string :city
      t.string :state

      t.timestamps

    end
  end
end
