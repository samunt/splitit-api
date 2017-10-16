class Bill < ApplicationRecord
  # model association
  has_many :items, dependent: :destroy
  has_many :users, foreign_key: :user_id

  # validations
  validates_presence_of :title, :created_by
end
