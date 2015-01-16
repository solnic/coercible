require 'spec_helper'

describe Coercer::Integer, '.to_float' do
  subject { object.to_float(fixnum) }

  let(:object) { described_class.new }
  let(:fixnum) { 1               }

  it { is_expected.to be_instance_of(Float) }

  it { is_expected.to eql(1.0) }
end
