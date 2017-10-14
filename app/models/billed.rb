class Billed < ApplicationRecord
  belongs_to :bill

  # validation
  validates_presence_of :firstName
  validates_presence_of :lastName
end
