require 'spec_helper'

describe Coercer::Integer do
  it_behaves_like 'Configurable' do
    describe '.config_name' do
      subject { described_class.config_name }

      it { is_expected.to be(:integer) }
    end
  end
end
