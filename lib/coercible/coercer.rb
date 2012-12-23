module Coercible

  class Coercer
    # @api private
    attr_reader :coercers

    # @api private
    def initialize(coercers = nil)
      @coercers = coercers || initialize_coercers
    end

    # @api public
    def [](klass)
      coercers[klass] or coercers[Object]
    end

    private

    def initialize_coercers
      # TODO: make this work when Integer's primitive is also Integer not Fixnum
      Coercer::Object.descendants.each_with_object({}) { |klass, hash|
        hash[klass.primitive] = klass.new(self)
      }
    end

  end # class Coercer

end # module Coercible
