require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do

    # first_name_full_widthはfamily_name_full_widthと同じバリデーションなので必要でなければ省く
    # first_name_kanaも同様

    context '新規登録が上手く行く時' do
      it "nickname、email、password、password_confirmation、family_name_full_width、first_name_full_width、family_name_kana、first_name_kana、birthdayが存在すれば登録できる" do
        expect(@user).to be_valid
      end

      it "メールアドレスが@を含んでいれば登録できる" do
        @user.email = "sample@sample.com"
        expect(@user).to be_valid
      end

      it "パスワードは6文字以上で半角英数字混合であれば登録できる" do
        @user.password = "aaAA11"
        @user.password_confirmation = "aaAA11"
        expect(@user).to be_valid
      end

      it "family_name_full_widthが全角であれば登録できる" do
        @user.family_name_full_width = "高橋"
        expect(@user).to be_valid
      end

      it "family_name_kanaが全角カタカナであれば登録できる" do
        @user.family_name_kana = "タカハシ"
        expect(@user).to be_valid
      end

    end

    context '新規登録が上手くいかない時' do
      it "nicknameが空では登録できない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it "emailが空では登録できない" do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it "emailが重複していると登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end

      it "emailが@を含んでいなければ登録できない" do
        @user.email = "samplesample.com"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end

      it "passwordが空では登録できない" do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it "passwordは5文字以下では登録できない" do
        @user.password = "aaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end

      it "passwordは半角英数字混合でなければ登録できない" do
        @user.password = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password 半角英数字で入力してください")
      end

      it "password_confirmationが空では登録できない" do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it "family_name_full_widthが空では登録できない" do
        @user.family_name_full_width = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name full width can't be blank")
      end

      it "family_name_full_widthは全角でなければ登録できない" do
        @user.family_name_full_width = "takahashi"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name full width 全角文字を使用してください")
      end

      it "family_name_kanaが空では登録できない" do
        @user.family_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana can't be blank")
      end

      it "family_name_kanaは全角カタカナでなければ登録できない" do
        @user.family_name_kana = "高橋"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana 全角カタカナを使用してください")
      end

      it "birthdayが空では登録できない" do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end

    end
  end
end