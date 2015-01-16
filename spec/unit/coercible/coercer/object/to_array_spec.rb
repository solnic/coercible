require 'spec_helper'

describe Coercer::Object, '.to_array' do
  subject { object.to_array(value) }

  let(:object)  { described_class.new }
  let(:value)   { Object.new      }
  let(:coerced) { [ value ]       }

  context 'when the value responds to #to_ary' do
    before do
      expect(value).to receive(:to_ary).and_return(coerced)
    end

    it { is_expected.to be(coerced) }

    it 'does not call #to_a if #to_ary is available' do
      expect(value).not_to receive(:to_a)
      subject
    end
  end

  context 'when the value responds to #to_a but not #to_ary' do
    before do
      expect(value).to receive(:to_a).and_return(coerced)
    end

    it { is_expected.to be(coerced) }
  end

  context 'when the value does not respond to #to_ary or #to_a' do
    it { is_expected.to be_instance_of(Array) }

    it { is_expected.to eq(coerced) }
  end

  context 'when the value returns nil from #to_ary' do
    before do
      expect(value).to receive(:to_ary).and_return(nil)
    end

    it 'calls #to_a as a fallback' do
      expect(value).to receive(:to_a).and_return(coerced)
      is_expected.to be(coerced)
    end

    it 'wraps the value in an Array if #to_a is not available' do
      is_expected.to eq(coerced)
    end
  end
end
