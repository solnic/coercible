require 'spec_helper'

describe Coercer::Object, '.to_integer' do
  subject { object.to_integer(value) }

  let(:object) { described_class.new }
  let(:value)  { double('value')   }

  context 'when the value responds to #to_int' do
    let(:coerced) { double('coerced') }

    before do
      expect(value).to receive(:to_int).and_return(coerced)
    end

    it { is_expected.to be(coerced) }
  end

  context 'when the value does not respond to #to_int' do
    specify { expect { subject }.to raise_error(UnsupportedCoercion) }
  end
end
