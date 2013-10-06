require 'spec_helper'

describe Food do
  describe "#have_taste?" do
    before do
      @food = Food.create!(name: :curry)
      @taste_a = Taste.create!(name: :aaaaaaaaaaaaaaaaaaaaa)
      @taste_b = Taste.create!(name: :bbbbbbbbbbbbbbbbbbbbb)
    end

    context "味を持っている場合" do
      before do
        @food.update(food_tastes_attributes: [{taste_id: @taste_a.id}])
      end

      subject { @food.have_taste?(@taste_a.id) }
      it "trueが返ること" do
        expect(subject).to be_true
      end
    end

    context "味を持っていない場合" do
      before do
        @food.update(food_tastes_attributes: [{taste_id: @taste_a.id}])
      end

      subject { @food.have_taste?(@taste_b.id) }
      it "falseが返ること" do
        expect(subject).to be_false
      end
    end

    context "そもそも味情報を一つも持っていない場合" do
      subject { @food.have_taste?(@taste_a.id) }
      it "falseが返ること" do
        expect(subject).to be_false
      end
    end
  end
end
