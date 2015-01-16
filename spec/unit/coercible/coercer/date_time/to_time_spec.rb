require 'spec_helper'

describe Coercer::DateTime, '.to_time' do
  subject { object.to_time(date_time) }

  let(:object)    { described_class.new          }
  let(:date_time) { DateTime.new(2011, 1, 1) }

  context 'when DateTime does not support #to_time' do
    if RUBY_VERSION < '1.9'
      before do
        expect(date_time).not_to respond_to(:to_time)
      end
    end

    it { is_expected.to be_instance_of(Time) }

    it { is_expected.to eql(Time.local(2011, 1, 1)) }
  end

  context 'when DateTime supports #to_time' do
    let(:time) { Time.local(2011, 1, 1) }

    before do
      allow(date_time).to receive(:to_time).and_return(time)
    end

    it { is_expected.to equal(time) }
  end
end
