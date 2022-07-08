class OrderAddress
  include ActiveModel::Model
  attr_accessor :price, :token, :user, :item, :postal_code, :prefecture_id, :city, :street, :building, :phone, :order,

  # ここにバリデーションの処理を書く
  validates :price, presence: true

  def save
    # 各テーブルにデータを保存する処理を書く
  end
end