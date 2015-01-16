require 'spec_helper'

describe Coercer::Symbol, '.to_string' do
  subject { object.to_string(symbol) }

  let(:object) { described_class.new }
  let(:symbol) { :piotr          }

  it { is_expected.to be_instance_of(String) }

  it { is_expected.to eql('piotr') }
end
