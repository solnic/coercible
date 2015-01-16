require 'spec_helper'

describe Coercer::TimeCoercions, '.to_date' do
  subject { object.to_date(value) }

  let(:object)  { coercer.new }
  let(:coercer) { Class.new(Coercer::Object) { include Coercer::TimeCoercions } }
  let(:value)   { double('value') }

  after do
    Coercer::Object.descendants.delete(coercer)
  end

  context 'when the value responds to #to_date' do
    before do
      expect(value).to receive(:to_date).and_return(Date.new(2011, 1, 1))
    end

    it { is_expected.to be_instance_of(Date) }

    it { is_expected.to eql(Date.new(2011, 1, 1)) }
  end

  context 'when the value does not respond to #to_date' do
    before do
      # use a string that Date.parse can handle
      expect(value).to receive(:to_s).and_return('2011-01-01')
    end

    it { is_expected.to be_instance_of(Date) }

    it { is_expected.to eql(Date.new(2011, 1, 1)) }
  end
end
