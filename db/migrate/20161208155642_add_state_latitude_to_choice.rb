class AddStateLatitudeToChoice < ActiveRecord::Migration[5.0]
  def change
    add_column :choices, :state_latitude, :float
  end
end
