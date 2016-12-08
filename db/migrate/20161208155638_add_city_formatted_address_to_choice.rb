class AddCityFormattedAddressToChoice < ActiveRecord::Migration[5.0]
  def change
    add_column :choices, :city_formatted_address, :string
  end
end
