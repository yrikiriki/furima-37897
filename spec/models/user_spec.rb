require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる時'do
     it '全てのカラムが存在すれば登録できる' do
      expect(@user).to be_valid
     end
    end
    context '新規登録できないとき' do
     it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("ニックネームを入力してください")
     end
     it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Eメールを入力してください")
     end
     it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードを入力してください")
     end
     it 'last_nameが空では登録できない' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("苗字(全角)を入力してください")
     end
     it 'first_nameが空では登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("名前(全角)を入力してください")
     end
     it 'last_name_kanaが空では登録できない' do
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("苗字(カナ)を入力してください")
     end
     it 'first_name_kanaが空では登録できない' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("名前(カナ)を入力してください")
     end
     it 'passwordとpassword_confirmationが不一致では登録できない' do
      @user.password = '123456'
      @user.password_confirmation = '1234567'
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
     end
     it '重複したemailが存在する場合は登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Eメールはすでに存在します")
     end
     it 'emailは@を含まないと登録できない' do
      @user.email = 'testmail'
      @user.valid?
      expect(@user.errors.full_messages).to include("Eメールは不正な値です")
     end
     it 'passwordは5文字以下では登録できない' do
      @user.password = '1234a'
      @user.password_confirmation = @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
     end
     it 'passwordは半角英数字を含まないと登録できない(数字のみver)' do
      @user.password = '123456'
      @user.password_confirmation = @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードは不正な値です")
     end
     it 'passwordは半角英数字を含まないと登録できない(英字のみver)' do
      @user.password = 'abcdef'
      @user.password_confirmation = @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードは不正な値です")
     end
     it 'passwordは全角文字を含むと登録できない' do
      @user.password = '123abあ'
      @user.password_confirmation = @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードは不正な値です")
     end
     it 'お名前(last_name)が全角（漢字・ひらがな・カタカナ）でなくては登録できない' do
      @user.last_name = 'test'
      @user.valid?
      expect(@user.errors.full_messages).to include("苗字(全角)は不正な値です")
     end
     it 'お名前(first_name)が全角（漢字・ひらがな・カタカナ）でなくては登録できない' do
      @user.first_name = 'test'
      @user.valid?
      expect(@user.errors.full_messages).to include("名前(全角)は不正な値です")
     end
     it 'お名前カナ(last_name_kana)が全角（カタカナ）でなくては登録できない' do
      @user.last_name_kana = 'てすと'
      @user.valid?
      expect(@user.errors.full_messages).to include("苗字(カナ)は不正な値です")
     end
     it 'お名前カナ(first_name)が全角（漢字・ひらがな・カタカナ）でなくては登録できない' do
      @user.first_name_kana = 'てすと'
      @user.valid?
      expect(@user.errors.full_messages).to include("名前(カナ)は不正な値です")
     end
     it 'birth_dateが空では登録できない' do
      @user.birth_date = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("生年月日を入力してください")
     end

  end
end
end
