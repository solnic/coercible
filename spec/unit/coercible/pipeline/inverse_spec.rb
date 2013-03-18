require 'spec_helper'

describe Coercible::Pipeline, '#inverse' do
  subject { object.inverse }

  let(:object)   { described_class.new(coercer, target)                         }
  let(:coercer)  { mock('Coercer', :coercers => coercers, :primitive => String) }
  let(:coercers) { { Integer => integer_coercer }                               }
  let(:target)   { Integer                                                      }
  let(:integer_coercer) { mock('Integer Coercer') }

  it { should eql(described_class.new(integer_coercer, String)) }
end

