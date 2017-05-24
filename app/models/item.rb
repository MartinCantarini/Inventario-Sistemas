class Item < ApplicationRecord
  belongs_to :purchase
  belongs_to :model
  validates :original, inclusion: { in: [ true, false ] }
end
