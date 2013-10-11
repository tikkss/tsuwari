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
    
    shared_examples_for "バリデーションエラーが発生しないこと" do |model, column, input|
      let(:obj) { model.new(column => input) }
      it { obj.should have(0).error_on(column) }
    end
    describe "name" do
      it_behaves_like "バリデーションエラーが発生しないこと", Shop, :name, 1
      it_behaves_like "バリデーションエラーが発生しないこと", Shop, :name, "abc"
    end
    describe "prefecture" do
      it_behaves_like "バリデーションエラーが発生しないこと", Shop, :prefecture, 1
      it_behaves_like "バリデーションエラーが発生しないこと", Shop, :prefecture, "abc"
    end
    describe "city" do
      it_behaves_like "バリデーションエラーが発生しないこと", Shop, :city, 1
      it_behaves_like "バリデーションエラーが発生しないこと", Shop, :city, "abc"
    end
    describe "address" do
      it_behaves_like "バリデーションエラーが発生しないこと", Shop, :address, 1
      it_behaves_like "バリデーションエラーが発生しないこと", Shop, :address, "abc"
    end
    describe "url" do
      it_behaves_like "バリデーションエラーが発生しないこと", Shop, :url, 1
      it_behaves_like "バリデーションエラーが発生しないこと", Shop, :url, "abc"
    end
    describe "category_id" do
      it_behaves_like "バリデーションエラーが発生しないこと", Shop, :category_id, 1
      context "対象カラムに文字列を入れた場合" do
        let(:obj) { Shop.new(:category_id => "abc") }
        it "エラーが発生すること" do
          obj.should have(1).error_on(:category_id)
        end
      end
    end
  end
end