require 'spec_helper'

describe Coercer::Numeric, '.to_decimal' do
  subject { object.to_decimal(numeric) }

  let(:object)  { described_class.new }
  let(:numeric) { Rational(2, 2)  }

  it { should eql(BigDecimal('1.0')) }
end
