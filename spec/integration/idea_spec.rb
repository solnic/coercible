require 'spec_helper'

module Coercible
  UnknownCoercion = Class.new(StandardError)

  class Coercer
    attr_reader :strict

    def initialize(options = {})
      @strict = options.fetch(:strict, true)
    end

    def for(object)
      klass = case object
      when ::String then Coercer::String
      when ::Hash   then Coercer::Hash
      end
      klass.new(object, strict)
    end

    class Object
      attr_reader :value

      def initialize(value, strict)
        @value  = value
        @strict = strict
      end

      def strict?
        @strict
      end
    end

    class String < Object
      def to_integer
        @value.to_i
      end
    end

    class Hash < Object
      def to_string
        strict? ? raise(UnknownCoercion) : value
      end
    end

  end
end

describe 'An idea how new API could look like' do
  it 'could work like that' do
    coercer = Coercible::Coercer.new(:strict => false)

    # coerce when we know how
    expect(coercer.for('1').to_integer).to be(1)

    # passthrough if we can't coerce
    expect(coercer.for({}).to_string).to eql({})

    coercer = Coercible::Coercer.new

    # raise by default if we can't coerce
    expect { coercer.for({}).to_string }.to raise_error
  end
end
