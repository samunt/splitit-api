class Bill < ApplicationRecord
  # model association
  has_many :billeds, dependent: :destroy

  # validations
  validates_presence_of :title, :created_by
end
