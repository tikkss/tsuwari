require 'spec_helper'

describe Food do
  it { should have_many(:food_tastes).dependent(:destroy) }
  it { should have_many(:tastes).through(:food_tastes) }
  it { should have_attached_file(:photo) }
  
  describe "validate" do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
    it { should ensure_length_of(:name).is_at_most(255) }
  end

  describe ".search" do
    shared_examples "料理検索" do
      before do
        @food = create(:food_long_name, :with_tastes)
        create_list(:food_short_name, 10)
      end

      subject { Food.search(search_word) }
      it { expect(subject.count).to eq(1) }
      it { expect(subject.first).to eq(@food) }
    end

    context "料理名前方一致する場合" do
      let(:search_word) { { name: @food.name[0..5], taste_ids: [''] } }
      it_behaves_like "料理検索"
    end

    context "料理名後方一致する場合" do
      let(:search_word) { { name: @food.name[15..-1], taste_ids: [''] } }
      it_behaves_like "料理検索"
    end

    context "料理名部分一致する場合" do
      let(:search_word) { { name: @food.name[5..15], taste_ids: [''] } }
      it_behaves_like "料理検索"
    end

    context "味を指定した場合" do
      let(:search_word) { { name: '', taste_ids: @food.taste_ids } }
      it_behaves_like "料理検索"
    end

    context "料理名部分一致するかつ味を指定した場合" do
      let(:search_word) { { name: @food.name, taste_ids: @food.taste_ids } }
      it_behaves_like "料理検索"
    end
  end
end
