# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Comment, "モデルに関するテスト", type: :model do
  describe '実際に保存してみる' do
    it "有効な投稿内容の場合は保存されるか" do
      expect(FactoryBot.build(:comment)).to be_valid
    end
  end
  context "空白のバリデーションチェック" do
    it "titleが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか" do
      comment = Comment.new(body:'')
      expect(comment).to be_invalid
      expect(comment.errors[:body]).to include("can't be blank")
    end
  end
end