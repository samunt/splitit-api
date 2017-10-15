class Item < ApplicationRecord
  belongs_to :bill

  validates_presence_of :name, :cost
end
