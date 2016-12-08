class AddAddressLatitudeToChoice < ActiveRecord::Migration[5.0]
  def change
    add_column :choices, :address_latitude, :float
  end
end
