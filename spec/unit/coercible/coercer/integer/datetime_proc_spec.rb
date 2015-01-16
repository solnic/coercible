require 'spec_helper'

describe Coercer::Integer, '#datetime_proc' do
  subject { object.datetime_proc }

  let(:object) { described_class.new }

  context "with Rubinius" do
    before do
      unless Coercible.rbx?
        allow(Coercible).to receive_messages(:rbx? => true)
      end
    end

    it { is_expected.to be_instance_of(Proc) }
  end

  context "with other Ruby VMs" do
    it { is_expected.to be_instance_of(Proc) }
  end
end
