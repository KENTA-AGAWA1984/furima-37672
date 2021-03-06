class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :postage_type
  belongs_to :prefecture
  belongs_to :preparation_day

  belongs_to :user
  has_one :order
  has_one_attached :image

  validates :name,               presence: true
  validates :introduction,       presence: true
  validates :category_id,        presence: true, numericality: { other_than: 1 }
  validates :condition_id,       presence: true, numericality: { other_than: 1 }
  validates :postage_type_id,    presence: true, numericality: { other_than: 1 }
  validates :prefecture_id,      presence: true, numericality: { other_than: 1 }
  validates :preparation_day_id, presence: true, numericality: { other_than: 1 }
  validates :price,              presence: true,
                                 numericality: { only_integer: true, only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  validates :image,              presence: true
end
