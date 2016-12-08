class AddCityLatitudeToChoice < ActiveRecord::Migration[5.0]
  def change
    add_column :choices, :city_latitude, :float
  end
end
