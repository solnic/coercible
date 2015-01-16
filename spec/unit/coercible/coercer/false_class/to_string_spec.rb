require 'spec_helper'

describe Coercer::FalseClass, '.to_string' do
  subject { object.to_string(false_class) }

  let(:object)      { described_class.new }
  let(:false_class) { false           }

  it { is_expected.to be_instance_of(String) }

  it { is_expected.to eql('false') }
end
