require 'spec_helper'

describe Coercer::Decimal, '.to_float' do
  subject { object.to_float(big_decimal) }

  let(:object)      { described_class.new   }
  let(:big_decimal) { BigDecimal('1.0') }

  it { is_expected.to be_instance_of(Float) }

  it { is_expected.to eql(1.0) }
end
