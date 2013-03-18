require 'spec_helper'

describe Coercible::Pipeline, '#call' do
  subject { object.call(value) }

  let(:object)  { described_class.new(coercer, target) }
  let(:target)  { String                               }
  let(:result)  { mock('Result')                       }
  let(:value)   { mock('Value')                        }
  let(:coercer) { mock('Coercer')                      }

  before do
    coercer.stub(:to_string => result)
  end

  it { should eql(result) }

  it 'should call coercer with value' do
    coercer.should_receive(:to_string).with(value).and_return(result)
    should eql(result)
  end
end
