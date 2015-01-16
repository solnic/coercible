require 'spec_helper'

describe Coercer::Object, '#inspect' do
  subject { object.inspect }

  let(:object) { described_class.new }

  it { is_expected.to eq('#<Coercible::Coercer::Object primitive=Object>')}
end
