class Choice < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :address, :uniqueness => { :scope => [:event_id] }

  validates :address, :presence => true

  validates :city, :presence => true

  validates :location, :presence => true

  validates :state, :presence => true

end
