require 'spec_helper'

describe Coercer::Date, '.to_datetime' do
  subject { object.to_datetime(date) }

  let(:object) { described_class.new      }
  let(:date)   { Date.new(2011, 1, 1) }

  context 'when Date does not support #to_datetime' do
    if RUBY_VERSION < '1.9'
      before do
        expect(date).not_to respond_to(:to_datetime)
      end
    end

    it { is_expected.to be_instance_of(DateTime) }

    it { is_expected.to eql(DateTime.new(2011, 1, 1)) }
  end

  context 'when Date supports #to_datetime' do
    let(:datetime) { DateTime.new(2011, 1, 1) }

    before do
      allow(date).to receive(:to_datetime).and_return(datetime)
    end

    it { is_expected.to equal(datetime) }
  end
end
