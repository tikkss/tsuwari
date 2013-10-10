require 'spec_helper'

describe Shop do
  describe "#valid?" do
    before { obj.valid? }
    context "全属性が空の場合" do
      let(:obj) { Shop.new }
      it "エラーが発生しないこと" do
        obj.should have(0).error_on(:name)
        obj.should have(0).error_on(:prefecture)
        obj.should have(0).error_on(:city)
        obj.should have(0).error_on(:address)
        obj.should have(0).error_on(:url)
        obj.should have(0).error_on(:category_id)
      end
    end
    
    describe "name" do
      let(:column) { :name }
      context "整数の場合" do
        let(:obj) { Shop.new(column => 1) }
        it "エラーが発生しないこと" do
          obj.should have(0).error_on(column)
        end
      end
      context "文字の場合" do
        let(:obj) { Shop.new(column => "abc") }
        it "エラーが発生しないこと" do
          obj.should have(0).error_on(column)
        end
      end
    end
    describe "prefecture" do
      let(:column) { :prefecture }
      context "整数の場合" do
        let(:obj) { Shop.new(column => 1) }
        it "エラーが発生しないこと" do
          obj.should have(0).error_on(column)
        end
      end
      context "文字の場合" do
        let(:obj) { Shop.new(column => "abc") }
        it "エラーが発生しないこと" do
          obj.should have(0).error_on(column)
        end
      end
    end
    describe "city" do
      let(:column) { :city }
      context "整数の場合" do
        let(:obj) { Shop.new(column => 1) }
        it "エラーが発生しないこと" do
          obj.should have(0).error_on(column)
        end
      end
      context "文字の場合" do
        let(:obj) { Shop.new(column => "abc") }
        it "エラーが発生しないこと" do
          obj.should have(0).error_on(column)
        end
      end
    end
    describe "address" do
      let(:column) { :address }
      context "整数の場合" do
        let(:obj) { Shop.new(column => 1) }
        it "エラーが発生しないこと" do
          obj.should have(0).error_on(column)
        end
      end
      context "文字の場合" do
        let(:obj) { Shop.new(column => "abc") }
        it "エラーが発生しないこと" do
          obj.should have(0).error_on(column)
        end
      end
    end
    describe "url" do
      let(:column) { :url }
      context "整数の場合" do
        let(:obj) { Shop.new(column => 1) }
        it "エラーが発生しないこと" do
          obj.should have(0).error_on(column)
        end
      end
      context "文字の場合" do
        let(:obj) { Shop.new(column => "abc") }
        it "エラーが発生しないこと" do
          obj.should have(0).error_on(column)
        end
      end
    end
    describe "category_id" do
      let(:column) { :category_id }
      context "整数の場合" do
        let(:obj) { Shop.new(column => 1) }
        it "エラーが発生しないこと" do
          obj.should have(0).error_on(column)
        end
      end
      context "文字の場合" do
        let(:obj) { Shop.new(column => "abc") }
        it "エラーが発生すること" do
          obj.should have(1).error_on(column)
        end
      end
    end
  end
end
