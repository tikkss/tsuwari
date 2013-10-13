require 'spec_helper'

describe HealthRecord do
  before { @health_record = HealthRecord.new(date: Date.today, time_period: 1, health: 1) }

  it { expect(@health_record).to respond_to(:date) }
  it { expect(@health_record).to respond_to(:time_period) }
  it { expect(@health_record).to respond_to(:health) }
  it { expect(@health_record).to be_valid }

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
end
