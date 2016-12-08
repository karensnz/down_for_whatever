class AddAddressLongitudeToChoice < ActiveRecord::Migration[5.0]
  def change
    add_column :choices, :address_longitude, :float
  end
end
