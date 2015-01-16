require 'spec_helper'

describe Coercer::DateTime, '.to_date' do
  subject { object.to_date(date_time) }

  let(:object)    { described_class.new          }
  let(:date_time) { DateTime.new(2011, 1, 1) }

  context 'when DateTime does not support #to_date' do
    if RUBY_VERSION < '1.9'
      before do
        expect(date_time).not_to respond_to(:to_date)
      end
    end

    it { is_expected.to be_instance_of(Date) }

    it { is_expected.to eql(Date.new(2011, 1, 1)) }
  end

  context 'when DateTime supports #to_date' do
    let(:date) { Date.new(2011, 1, 1) }

    before do
      allow(date_time).to receive(:to_date).and_return(date)
    end

    it { is_expected.to equal(date) }
  end
end
