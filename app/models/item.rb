class Item < ApplicationRecord
  belongs_to :purchase
  belongs_to :model
end
