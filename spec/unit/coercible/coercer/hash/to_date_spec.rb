require 'spec_helper'

describe Coercer::Hash, '.to_date' do
  subject { object.to_date(hash) }

  let(:object) { described_class.new }

  context 'when time segments are missing' do
    let(:time_now) { Time.local(2011, 1, 1) }
    let(:hash)     { {}                     }

    before do
      allow(Time).to receive(:now).and_return(time_now)  # freeze time
    end

    it { is_expected.to be_instance_of(Date) }

    it 'uses the Time now to populate the segments' do
      is_expected.to eql(Date.new(2011, 1, 1))
    end
  end

  context 'when time segments are integers' do
    let(:hash) { { :year => 2011, :month => 1, :day => 1 } }

    it { is_expected.to be_instance_of(Date) }

    it { is_expected.to eql(Date.new(2011, 1, 1)) }
  end

  context 'when time segments are strings' do
    let(:hash) { { :year => '2011', :month => '1', :day => '1' } }

    it { is_expected.to be_instance_of(Date) }

    it { is_expected.to eql(Date.new(2011, 1, 1)) }
  end
end
