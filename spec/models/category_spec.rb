#-*- coding: utf-8 -*-
require 'spec_helper'

describe Category do
  describe "associations" do
    before do
      @category = Category.create(name: "カテゴリ")
      Shop.create(name: "店舗", category_id: @category.id)
    end
    it "カテゴリ削除により、関連する店舗のカテゴリIDをnilにすること" do
      expect { @category.destroy }.to change { Shop.first.category_id }.to(nil)
    end
  end
  
  describe "#valid?" do
    before { obj.valid? }
    describe "name" do
      let(:column) { :name }
      context "空白の場合" do
        let(:obj) { Category.new(name: "") }
        it "エラーが発生すること" do
          obj.should have(1).error_on(column)
        end
      end
      context "設定する場合" do
        context "全角文字の場合" do
          let(:obj) { Category.new(name: "カテゴリ") }
          it "エラーが発生しないこと" do
            obj.should have(0).error_on(column)
          end
        end
        context "半角文字の場合" do
          let(:obj) { Category.new(name: "category") }
          it "エラーが発生しないこと" do
            obj.should have(0).error_on(column)
          end
        end
      end
    end
  end
end
