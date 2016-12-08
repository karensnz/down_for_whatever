class Event < ApplicationRecord
  # Direct associations

  belongs_to :host,
             :class_name => "User"

  # Indirect associations

  # Validations

  validates :date, :presence => true

  validates :host_id, :presence => true

  validates :time, :uniqueness => { :scope => [:date, :host_id] }

  validates :time, :presence => true

end
