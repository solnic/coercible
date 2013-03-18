require 'spec_helper'

describe Coercible::Pipeline, '#method_name' do
  subject { object.method_name }

  let(:object) { described_class.new(coercer, target) }

  let(:coercer) { mock('Coercer') }

  context 'if target is valid' do
    let(:target) { String }

    it { should eql(:to_string) }

    it_should_behave_like 'an idempotent method'
  end

  context 'if target is NOT valid' do
    let(:target) { Object }

    it 'should raise error' do
      expect { subject }.to raise_error("No coercion to: Object is defined")
    end
  end
end
