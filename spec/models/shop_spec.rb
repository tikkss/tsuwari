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
    
    shared_examples_for "店舗のカラムへ整数入力時にエラーが発生しないこと" do
      let(:obj) { Shop.new(column => 1) }
      it { obj.should have(0).error_on(column) }
    end
    shared_examples_for "店舗のカラムへ文字入力時にエラーが発生しないこと" do
      let(:obj) { Shop.new(column => "abc") }
      it { obj.should have(0).error_on(column) }
    end
    describe "name" do
      let(:column) { :name }
      it_behaves_like "店舗のカラムへ整数入力時にエラーが発生しないこと"
      it_behaves_like "店舗のカラムへ文字入力時にエラーが発生しないこと"
    end
    describe "prefecture" do
      let(:column) { :prefecture }
      it_behaves_like "店舗のカラムへ整数入力時にエラーが発生しないこと"
      it_behaves_like "店舗のカラムへ文字入力時にエラーが発生しないこと"
    end
    describe "city" do
      let(:column) { :city }
      it_behaves_like "店舗のカラムへ整数入力時にエラーが発生しないこと"
      it_behaves_like "店舗のカラムへ文字入力時にエラーが発生しないこと"
    end
    describe "address" do
      let(:column) { :address }
      it_behaves_like "店舗のカラムへ整数入力時にエラーが発生しないこと"
      it_behaves_like "店舗のカラムへ文字入力時にエラーが発生しないこと"
    end
    describe "url" do
      let(:column) { :url }
      it_behaves_like "店舗のカラムへ整数入力時にエラーが発生しないこと"
      it_behaves_like "店舗のカラムへ文字入力時にエラーが発生しないこと"
    end
    describe "category_id" do
      let(:column) { :category_id }
      it_behaves_like "店舗のカラムへ整数入力時にエラーが発生しないこと"
      context "文字の場合" do
        let(:obj) { Shop.new(column => "abc") }
        it "エラーが発生すること" do
          obj.should have(1).error_on(column)
        end
      end
    end
  end
end
