class AddStateFormattedAddressToChoice < ActiveRecord::Migration[5.0]
  def change
    add_column :choices, :state_formatted_address, :string
  end
end
