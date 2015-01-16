require 'spec_helper'

describe Coercer::Integer, '#datetime_format' do
  subject { object.datetime_format }

  let(:object) { described_class.new }

  context "with Rubinius" do
    before do
      unless Coercible.rbx?
        allow(Coercible).to receive_messages(:rbx? => true)
      end
    end

    it { is_expected.to eq('%Q') }
  end

  context "with other Ruby VMs" do
    before do
      if Coercible.rbx?
        allow(Coercible).to receive_messages(:rbx? => false)
      end
    end

    it { is_expected.to eq('%s') }
  end
end
