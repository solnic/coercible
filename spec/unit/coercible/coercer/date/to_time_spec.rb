require 'spec_helper'

describe Coercer::Date, '.to_time' do
  subject { object.to_time(date) }

  let(:object) { described_class.new      }
  let(:date)   { Date.new(2011, 1, 1) }

  it { is_expected.to be_instance_of(Time) }

  it { is_expected.to eql(Time.local(2011, 1, 1)) }
end
