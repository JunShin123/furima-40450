require 'rails_helper'

RSpec.describe BuyerHistory, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @buyer_history = FactoryBot.build(:buyer_history, user_id: @user.id, item_id: @item.id)
  end


  describe '住所保存ができる' do

    context '住所保存ができる場合' do
      it "postal_codeとprefecture、city、street_address、phone_number、tokenが存在すれば保存できる" do
        expect(@buyer_history).to be_valid
      end

      it "建物名が空でも保存できる" do
        @buyer_history.building = ''
        expect(@buyer_history).to be_valid
      end
    end

    context '住所保存ができない場合' do

      it "postal_codeが空では保存できない" do
        @buyer_history.postal_code = ''
        @buyer_history.valid?
        expect(@buyer_history.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'postal_code が正しい形式でない場合は保存できないこと' do
        @buyer_history.postal_code = '1234567'
        @buyer_history.valid?
        expect(@buyer_history.errors.full_messages).to include('Postal code is invalid')
      end

      it 'prefecture_id が空では保存できないこと' do
        @buyer_history.prefecture_id = nil
        @buyer_history.valid?
        expect(@buyer_history.errors.full_messages).to include("Prefecture can't be blank")
      end

      it "prefectureが「---」を選択した状態では保存できない" do
        @buyer_history.prefecture_id = 1
        @buyer_history.valid?
        expect(@buyer_history.errors.full_messages).to include("Prefecture must be other than 1")
      end

      it "cityが空では保存できない" do
        @buyer_history.city = ''
        @buyer_history.valid?
        expect(@buyer_history.errors.full_messages).to include("City can't be blank")
      end

      it "street_addressが空では保存できない" do
        @buyer_history.street = ''
        @buyer_history.valid?
        expect(@buyer_history.errors.full_messages).to include("Street can't be blank")
      end

      it "phone_numberが空では保存できない" do
        @buyer_history.phone_number = ''
        @buyer_history.valid?
        expect(@buyer_history.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_number が正しい形式でない場合は保存できないこと' do
        @buyer_history.phone_number = '090-12345678'
        @buyer_history.valid?
        expect(@buyer_history.errors.full_messages).to include('Phone number is invalid')
      end


      it '9桁以下の電話番号で保存できない' do
        @buyer_history.phone_number = '090'
        @buyer_history.valid?
        expect(@buyer_history.errors.full_messages).to include('Phone number is invalid')
      end

      it '12桁以上の電話番号で保存できない' do
        @buyer_history.phone_number = '000111122223'
        @buyer_history.valid?
        expect(@buyer_history.errors.full_messages).to include('Phone number is invalid')
      end


      it 'item_id が空では保存できないこと' do
        @buyer_history.item_id = nil
        @buyer_history.valid?
        expect(@buyer_history.errors.full_messages).to include("Item can't be blank")
      end

      it 'user_id が空で は保存できないこと'do
        @buyer_history.user_id = nil
        @buyer_history.valid?
        expect(@buyer_history.errors.full_messages).to include("User can't be blank")
      end

      it "tokenが空では保存できないこと" do
        @buyer_history.token = nil
        @buyer_history.valid?
        expect(@buyer_history.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
