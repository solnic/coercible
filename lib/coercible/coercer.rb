module Coercible

  class Coercer

    # @api private
    attr_reader :coercers

    # @api private
    def initialize(coercers = {})
      @coercers = coercers
      initialize_default_coercer
    end

    # @api public
    def [](klass)
      fetch(klass) || coercers[::Object]
    end

    private

    # @api private
    def fetch(klass)
      coercers[klass] || initialize_coercer(klass)
    end

    # @api private
    def initialize_coercer(klass)
      coercers[klass] = (Coercer::Object.determine_type(klass) || Coercer::Object).new(self)
    end

    # @api private
    def initialize_default_coercer
      coercers[::Object] = Coercer::Object.new(self)
    end

  end # class Coercer

end # module Coercible
