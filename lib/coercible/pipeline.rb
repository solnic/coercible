module Coercible
  # A coercer dedicated to specific coercion target
  class Pipeline
    include Equalizer.new(:coercer, :target)

    # Return coercer
    #
    # @return [Coercer]
    #
    # @api private
    attr_reader :coercer

    # Return target
    #
    # @return [Class]
    #
    # @api private
    attr_reader :target

    # Return method name
    #
    # @return [Symbol]
    #
    # @api private
    #
    attr_reader :method_name

    # Call pipeline with value
    #
    # @example Calling a string to integer pipeline
    #
    #   pipeline = coercer[String].pipeline(Integer)
    #   pipeline.call('10') # => 10
    #
    # @param [Object] value
    #
    # @return [Object]
    #
    # @api public
    #
    def call(value)
      coercer.public_send(method_name, value)
    end

    # Return inverse pipeline
    #
    # @return [Pipeline]
    # 
    # @api private
    #
    def inverse
      self.class.new(coercer.coercers[target], coercer.primitive)
    end

    # Initialize object
    #
    # @param [Coercer] coercer
    # @param [Class] target
    #
    # @return [undefined]
    #
    # @api private
    #
    def initialize(coercer, target)
      @coercer, @target = coercer, target
      @method_name = Coercible::Coercer::MAPPING.fetch(target) {
        raise "No coercion to: #{target} is defined"
      }
    end

  end # Pipeline
end # Coercible
