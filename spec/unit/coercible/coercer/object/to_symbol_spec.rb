require 'spec_helper'

describe Coercer::Object, '.to_symbol' do
  subject { object.to_symbol(value) }

  let(:object) { described_class.new }
  let(:value)  { double('value')   }

  context 'when the value responds to #to_sym' do
    let(:coerced) { double('coerced') }

    before do
      expect(value).to receive(:to_sym).and_return(coerced)
    end

    it { is_expected.to be(coerced) }
  end

  context 'when the value does not respond to #to_sym' do
    specify { expect { subject }.to raise_error(UnsupportedCoercion) }
  end
end
