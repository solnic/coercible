require 'spec_helper'

describe Coercer::Object, '.to_string' do
  subject { object.to_string(value) }

  let(:object) { described_class.new }
  let(:value)  { Object.new      }

  context 'when the value responds to #to_str' do
    let(:coerced) { double('coerced') }

    before do
      expect(value).to receive(:to_str).and_return(coerced)
    end

    it { is_expected.to be(coerced) }
  end

  context 'when the value does not respond to #to_str' do
    specify { expect { subject }.to raise_error(UnsupportedCoercion) }
  end
end
