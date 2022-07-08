class Order < ApplicationRecord
  validates :user, presence: true
  validates :item, presence: true
end
