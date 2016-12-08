class AddStateLongitudeToChoice < ActiveRecord::Migration[5.0]
  def change
    add_column :choices, :state_longitude, :float
  end
end
