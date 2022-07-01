require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品出品がうまくいくとき' do
      it 'name、image、introduction、category_idとcondition_idとpostage_type_idとprefecture_idとpreparation_day_idが存在すれば出品できる' do
        expect(@item).to be_valid
      end
      it '価格が¥300~¥9,999,999(半角）だと出品できる' do
        @item.price = '500'
        expect(@item).to be_valid
      end
    end
    context '商品出品がうまくいかないとき' do
      it 'ユーザーが紐付いていなければ投稿できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
      it '商品画像が空だと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が空だと出品できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it '商品の説明が空だと出品できない' do
        @item.introduction = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Introduction can't be blank")
      end
      it 'カテゴリーの情報が空だと出品できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 1')
      end
      it ' 商品の状態の情報が空だと出品できない' do
        @item.condition_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Condition must be other than 1')
      end
      it '配送料の負担の情報が空だと出品できない' do
        @item.postage_type_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Postage type must be other than 1')
      end
      it '発送元の地域の情報が空だと出品できない' do
        @item.prefecture_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture must be other than 1')
      end
      it '発送までの日数の情報が空だと出品できない' do
        @item.preparation_day_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Preparation day must be other than 1')
      end
      it '価格の情報が空だと出品できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '価格が¥300~¥9,999,999でないと出品できない' do
        @item.price = '100'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end
      it '価格がでないと出品できない' do
        @item.price = '1111.1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be an integer')
      end
      it '価格は半角でないと出品できない' do
        @item.price = '５０００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
    end
  end
end
