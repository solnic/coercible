require 'spec_helper'

describe Coercer::Hash, '.to_datetime' do
  subject { object.to_datetime(hash) }

  let(:object) { described_class.new }

  context 'when time segments are missing' do
    let(:time_now) { Time.local(2011, 1, 1) }
    let(:hash)     { {}                     }

    before do
      allow(Time).to receive(:now).and_return(time_now)  # freeze time
    end

    it { is_expected.to be_instance_of(DateTime) }

    it 'uses the Time now to populate the segments' do
      is_expected.to eql(DateTime.new(2011, 1, 1))
    end
  end

  context 'when time segments are integers' do
    let(:hash) { { :year => 2011, :month => 1, :day => 1, :hour => 1, :min => 1, :sec => 1 } }

    it { is_expected.to be_instance_of(DateTime) }

    it { is_expected.to eql(DateTime.new(2011, 1, 1, 1, 1, 1)) }
  end

  context 'when time segments are strings' do
    let(:hash) { { :year => '2011', :month => '1', :day => '1', :hour => '1', :min => '1', :sec => '1' } }

    it { is_expected.to be_instance_of(DateTime) }

    it { is_expected.to eql(DateTime.new(2011, 1, 1, 1, 1, 1)) }
  end
end
