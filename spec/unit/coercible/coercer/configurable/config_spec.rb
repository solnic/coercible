require 'spec_helper'

describe Coercer::Configurable, '.config' do
  subject { object.config(&block) }

  let(:object)  {
    Class.new {
      extend Coercer::Configurable, Options
      config_keys [ :one, :two ]
    }
  }

  let(:block)               { Proc.new { |config| config.test } }
  let(:configuration)       { double('configuration') }
  let(:configuration_class) { double('configuration_class') }

  before do
    allow(object).to receive_messages(:configuration_class => configuration_class)
    expect(configuration_class).to receive(:build).with(object.config_keys).
      and_return(configuration)
    expect(configuration).to receive(:test)
  end

  it { is_expected.to be(configuration) }
end
