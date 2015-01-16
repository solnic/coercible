require 'spec_helper'

describe Configuration, '.build' do
  subject { described_class.build(keys) }

  let(:keys) { [ :foo, :bar ] }

  it { is_expected.to be_instance_of(described_class) }

  it { is_expected.to respond_to(:foo) }
  it { is_expected.to respond_to(:foo=) }

  it { is_expected.to respond_to(:bar) }
  it { is_expected.to respond_to(:bar=) }
end
