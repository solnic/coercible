require 'spec_helper'

describe Coercer::Numeric, '.to_integer' do
  subject { object.to_integer(numeric) }

  let(:object)  { described_class.new }
  let(:numeric) { Rational(2, 2)  }

  it { is_expected.to eql(1) }
end
