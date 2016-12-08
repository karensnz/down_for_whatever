class Event < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :time, :uniqueness => { :scope => [:date, :host_id] }

  validates :time, :presence => true

end
