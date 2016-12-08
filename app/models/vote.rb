class Vote < ApplicationRecord
  # Direct associations

  belongs_to :guest,
             :class_name => "User"

  # Indirect associations

  # Validations

  validates :guest_id, :presence => true

end
