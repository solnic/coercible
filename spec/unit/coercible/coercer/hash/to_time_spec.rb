require 'spec_helper'

describe Coercer::Hash, '.to_time' do
  subject { object.to_time(hash) }

  let(:object) { described_class.new }

  context 'when time segments are missing' do
    let(:time_now) { Time.local(2011, 1, 1) }
    let(:hash)     { {}                     }

    before do
      allow(Time).to receive(:now).and_return(time_now)  # freeze time
    end

    it { is_expected.to be_instance_of(Time) }

    it 'uses the Time now to populate the segments' do
      is_expected.to eql(time_now)
    end
  end

  context 'when time segments are integers' do
    let(:hash) { { :year => 2011, :month => 1, :day => 1, :hour => 1, :min => 1, :sec => 1 } }

    it { is_expected.to be_instance_of(Time) }

    it { is_expected.to eql(Time.local(2011, 1, 1, 1, 1, 1)) }
  end

  context 'when time segments are strings' do
    let(:hash) { { :year => '2011', :month => '1', :day => '1', :hour => '1', :min => '1', :sec => '1' } }

    it { is_expected.to be_instance_of(Time) }

    it { is_expected.to eql(Time.local(2011, 1, 1, 1, 1, 1)) }
  end
end
