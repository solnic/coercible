require 'spec_helper'

describe Coercible::Coercer::Object, '#pipeline' do
  subject { object.pipeline(target) }

  let(:object) { described_class.new(coercers) }

  let(:target)   { String }
  let(:coercers) { mock('Coercer') }

  it { should eql(Coercible::Pipeline.new(object, target)) }
end
