class Guest < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :guest_id, :uniqueness => true

  validates :guest_id, :presence => true

end
