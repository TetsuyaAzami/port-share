require 'rails_helper'

RSpec.describe User, type: :model do
subject(:user){User.new(
  email: "tetsuya@email.com",
  password: "password"
)}
  context "名前が入力されている場合" do
  it "ユーザー登録が成功すること" do
  
  user.name = "哲也"
  expect(user).to be_valid

  end
  end

  context "名前が空の場合" do
    it "ユーザー登録が成功しないこと" do
    user.name = ""
    user.valid?
    expect(user.errors[:name]).to include("を入力してください。")

    end
  end

end
