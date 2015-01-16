require 'spec_helper'

describe Coercer::Date, '.to_string' do
  subject { object.to_string(date) }

  let(:object) { described_class.new      }
  let(:date)   { Date.new(2011, 1, 1) }

  it { is_expected.to be_instance_of(String) }

  it { is_expected.to eql('2011-01-01') }
end
