require 'spec_helper'

describe Coercer::Float, '.to_decimal' do
  subject { object.to_decimal(float) }

  let(:object) { described_class.new }
  let(:float)  { 1.0             }

  it { is_expected.to be_instance_of(BigDecimal) }

  it { is_expected.to eql(BigDecimal('1.0')) }
end
