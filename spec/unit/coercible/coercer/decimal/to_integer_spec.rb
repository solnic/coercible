require 'spec_helper'

describe Coercer::Decimal, '.to_integer' do
  subject { object.to_integer(big_decimal) }

  let(:object)      { described_class.new   }
  let(:big_decimal) { BigDecimal('1.0') }

  it { is_expected.to be_kind_of(Integer) }

  it { is_expected.to eql(1) }
end
