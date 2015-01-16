require 'spec_helper'

describe Coercer::Integer, '.to_string' do
  subject { object.to_string(integer) }

  let(:object)  { described_class.new }
  let(:integer) { 1               }

  it { is_expected.to be_instance_of(String) }

  it { is_expected.to eql('1') }
end
