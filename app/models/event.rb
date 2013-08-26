class Event < ActiveRecord::Base
  has_many :guests, dependent: :destroy, inverse_of: :event
  validates_presence_of :name
end
