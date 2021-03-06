class Guest < ApplicationRecord
  # Direct associations

  belongs_to :event

  belongs_to :guest,
             :class_name => "User"

  # Indirect associations

  # Validations

  validates :event_id, :presence => true

  validates :guest_id, :uniqueness => { :scope => [:event_id] }

  validates :guest_id, :presence => true

end
