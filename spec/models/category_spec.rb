#-*- coding: utf-8 -*-
require 'spec_helper'

describe Category do
  it { should have_many(:shops) }
  it { should validate_presence_of(:name) }
  
  describe "associations" do
    before do
      @category = Category.create(name: "カテゴリ")
      Shop.create(name: "店舗", category_id: @category.id)
    end
    it "カテゴリ削除により、関連する店舗のカテゴリIDをnilにすること" do
      expect { @category.destroy }.to change { Shop.first.category_id }.to(nil)
    end
  end
end
