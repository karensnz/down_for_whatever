class AddAddressFormattedAddressToChoice < ActiveRecord::Migration[5.0]
  def change
    add_column :choices, :address_formatted_address, :string
  end
end
