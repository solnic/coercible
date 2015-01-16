require 'spec_helper'

describe Coercer::Decimal, '.to_string' do
  subject { object.to_string(big_decimal) }

  let(:object)      { described_class.new   }
  let(:big_decimal) { BigDecimal('1.0') }

  it { is_expected.to be_instance_of(String) }

  it { is_expected.to eql('1.0') }
end
