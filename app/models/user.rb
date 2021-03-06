class User < ApplicationRecord
  # Direct associations

  has_many   :votes,
             :foreign_key => "guest_id",
             :dependent => :destroy

  has_many   :guests,
             :foreign_key => "guest_id",
             :dependent => :destroy

  has_many   :events,
             :foreign_key => "host_id",
             :dependent => :destroy

  has_many   :invites, :through => :guests, :source => :event

  has_many   :voted_choices, :through => :votes, :source => :choice

  # Indirect associations

  # Validations

  validates :name, :presence => true

  validates :phone, :uniqueness => true

  validates :phone, :presence => true

  validates :phone, :length => { :minimum => 10, :maximum => 10 }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
