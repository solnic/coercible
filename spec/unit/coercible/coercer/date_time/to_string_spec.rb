require 'spec_helper'

describe Coercer::DateTime, '.to_string' do
  subject { object.to_string(date_time) }

  let(:object)    { described_class.new }
  let(:date_time) { DateTime.new(2011, 1, 1, 0, 0, 0, 0) }

  it { is_expected.to be_instance_of(String) }

  it { is_expected.to eql('2011-01-01T00:00:00+00:00') }
end
