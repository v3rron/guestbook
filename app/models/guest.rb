class Guest < ActiveRecord::Base
  belongs_to :event, inverse_of: :guests
  validates_inclusion_of :designation, :in => %w[Mr Ms Mrs Dr]
  validates :email, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i }
  validates_presence_of :email
  validates_uniqueness_of :email, scope: :event
  validates :name, :presence => true

  before_validation do
    self.phone = phone.to_s.gsub(/\D/, '').to_i
  end

  def status
    read_attribute(:designation).to_sym
  end

  def status= (value)
    write_attribute(:designation, value.to_s)
  end
end
