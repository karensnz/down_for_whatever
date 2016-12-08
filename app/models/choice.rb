class Choice < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :location, :presence => true

  validates :state, :presence => true

end
