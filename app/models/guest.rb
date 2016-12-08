class Guest < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :event_id, :presence => true

  validates :guest_id, :uniqueness => true

  validates :guest_id, :presence => true

end
