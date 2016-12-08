class AddCityLongitudeToChoice < ActiveRecord::Migration[5.0]
  def change
    add_column :choices, :city_longitude, :float
  end
end
