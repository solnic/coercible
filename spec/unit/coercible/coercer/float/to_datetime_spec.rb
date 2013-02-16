require 'spec_helper'

describe Coercer::Float, '#to_float' do
  subject { object.to_datetime(value) }

  let(:object) { described_class.new }
  let(:value)  { 1361036672.12 }

  it { should be_instance_of(DateTime) }
end
