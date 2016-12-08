class Choice < ApplicationRecord
  # Direct associations

  belongs_to :event

  # Indirect associations

  # Validations

  validates :address, :uniqueness => { :scope => [:event_id] }

  validates :address, :presence => true

  validates :city, :presence => true

  validates :location, :presence => true

  validates :state, :presence => true

end
