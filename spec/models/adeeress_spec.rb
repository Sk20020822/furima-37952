require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item)
    @item.save
    @purchase_address = FactoryBot.build(:purchase_address, user_id: @user.id, item_id: @item.id)
  end

    describe '住所新規登録' do
      context '住所登録できる場合' do
        it "building_name以外が存在すれば登録できる" do
          expect(@purchase_address).to be_valid
        end
        it 'building_nameは空でも保存できること' do
          @purchase_address.building_name = ''
          expect(@purchase_address).to be_valid
        end
        
      end
      context '住所登録できない場合' do
        it "tokenが空では登録できないこと" do
          @purchase_address.token = nil
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
        end
        it "post_codeが空では登録できない" do
          @purchase_address.post_code = nil
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("Post code can't be blank")
        end
        it 'prefecture_idが未選択だと出品できない' do
          @purchase_address.prefecture_id = 1
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("Prefecture must be other than 1")
        end
        it "cityが空では登録できない" do
          @purchase_address.city = nil
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("City can't be blank")
        end
        it "home_numが空では登録できない" do
          @purchase_address.home_num = nil
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("Home num can't be blank")
        end
        it "telが空では登録できない" do
          @purchase_address.tel = nil
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("Tel can't be blank")
        end
        it 'telが全角数字だと登録できない' do
          @purchase_address.tel = '０９０１２３４５６７８'
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("Tel is invalid")
        end
      end
    end
end
