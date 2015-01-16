require 'spec_helper'

describe Coercer::Integer, '.to_decimal' do
  subject { object.to_decimal(fixnum) }

  let(:object) { described_class.new }
  let(:fixnum) { 1               }

  it { is_expected.to be_instance_of(BigDecimal) }

  it { is_expected.to eql(BigDecimal('1.0')) }
end
