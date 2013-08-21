class Guest < ActiveRecord::Base
  belongs_to :event
  validates_inclusion_of :designation, :in => ['Mr.', 'Ms.', 'Mrs.', 'Dr.']

  def status
    read_attribute(:designation).to_sym
  end

  def status= (value)
    write_attribute(:designation, value.to_s)
  end
end
