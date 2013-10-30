require 'spec_helper'

describe HealthRecord do
  describe '属性' do
    subject { HealthRecord.new(date: Date.today, time_period: 1, health: 1) }
    it { should respond_to(:date) }
    it { should respond_to(:time_period) }
    it { should respond_to(:health) }
    it { should be_valid }
    it { should have_many(:eatings).dependent(:destroy) }
    it { should have_many(:foods).through(:eatings) }
    it { should validate_presence_of(:health) }
    it { should validate_presence_of(:time_period) }
    it { should validate_uniqueness_of(:date).scoped_to(:time_period) }
    it { should accept_nested_attributes_for(:eatings).allow_destroy(true) }
  end

  describe '#valid?' do
    describe '#time_period' do
      it '選択肢以外の場合、エラーが発生すること' do
        expect(HealthRecord.new(time_period: 4)).to have(1).error_on(:time_period)
      end
      it '選択肢の場合、エラーが発生しないこと' do
        expect(HealthRecord.new(time_period: 1)).to have(0).error_on(:time_period)
      end
    end
    describe '#health' do
      it '選択肢以外の場合、エラーが発生すること' do
        expect(HealthRecord.new(health: 4)).to have(1).error_on(:health)
      end
      it '選択肢の場合、エラーが発生しないこと' do
        expect(HealthRecord.new(health: 1)).to have(0).error_on(:health)
      end
    end
  end

  describe "#eatings_invalid?" do
    context "各eatingのvalidateにひっかからない場合" do
      context "eatingを複数件登録した場合" do
       before do
         @health_record = build(
           :health_record,
           eatings: build_list(:eating, 5, health_record: nil)
         )
         @health_record.save
       end

       subject { @health_record.eatings_invalid? }
       it { expect(subject).to be_false }
      end

      context "eatingを一件も登録していない場合" do
       before do
         @health_record = build(:health_record)
         @health_record.save
       end

       subject { @health_record.eatings_invalid? }
       it { expect(subject).to be_false }
      end
    end

    context "各eatingのvalidateにひっかかる場合" do
      context "eatingのvalidateに引っかかるものだけ登録されている場合" do
        before do
          @health_record = build(
            :health_record,
            eatings: build_list(:eating, 5, health_record: nil, food_id: nil)
          )
          @health_record.save
        end

        subject { @health_record.eatings_invalid? }
        it { expect(subject).to be_true }
      end

      context "eatingのvalidateに引っかかるものと引っかからないものが混在している場合" do
        before do
          @health_record = build(
            :health_record,
            eatings: build_list(:eating, 2, health_record: nil, food_id: nil)
          )
          @health_record.eatings += build_list(:eating, 3, health_record: nil)
          @health_record.save
        end

        subject { @health_record.eatings_invalid? }
        it { expect(subject).to be_true }
      end
    end
  end

  describe "#not_found_food" do
    context "各eatingのvalidateにひっかからない場合" do
      before do
        @health_record = build(
          :health_record,
          eatings: build_list(:eating, 5, health_record: nil)
        )
        @health_record.save
      end

      subject { @health_record.not_found_food }
      it { expect(subject).to be_nil }
    end

    context "各eatingのvalidateにひっかかる場合" do
      context "eatingのvalidateに引っかかるものだけ登録されている場合" do
        before do
          @ng_eatings = build_list(:eating, 5, health_record: nil, food_id: nil)
          @health_record = build(
            :health_record,
            eatings: @ng_eatings
          )
          @health_record.save
        end

        let(:not_found_food) { @ng_eatings.map(&:food_name).join(", ") }
        subject { @health_record.not_found_food }
        it { expect(subject).to eq(not_found_food) }
      end

      context "eatingのvalidateに引っかかるものと引っかからないものが混在している場合" do
        before do
          @ng_eatings = build_list(:eating, 2, health_record: nil, food_id: nil)
          @ok_eatings = build_list(:eating, 3, health_record: nil)
          @health_record = build(
            :health_record,
            eatings: @ng_eatings + @ok_eatings
          )
          @health_record.save
        end

        let(:not_found_food) { @ng_eatings.map(&:food_name).join(", ") }
        subject { @health_record.not_found_food }
        it { expect(subject).to eq(not_found_food) }
      end
    end
  end
end
