require 'spec_helper'

describe Coercer::Time, '.to_integer' do
  subject { described_class.new.to_integer(value) }

  let(:time)  { Time.now }
  let(:value) { time     }

  it { is_expected.to eql(time.to_i) }
end
