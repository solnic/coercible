require 'spec_helper'

describe Coercer::Integer, '#to_datetime' do
  subject { object.to_datetime(value) }

  let(:object) { described_class.new }
  let(:value)  { 1361036672 }

  it { should be_instance_of(DateTime) }

  its(:year)   { should be(2013) }
  its(:month)  { should be(2) }
  its(:day)    { should be(16) }
  its(:hour)   { should be(17) }
  its(:minute) { should be(44) }
  its(:second) { should be(32) }
end
