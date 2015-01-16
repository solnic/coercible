require 'spec_helper'

describe Coercer::Date, '.to_date' do
  subject { object.to_date(date) }

  let(:object) { described_class.new      }
  let(:date)   { Date.new(2012, 1, 1) }

  it { is_expected.to equal(date) }
end
