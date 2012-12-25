module Coercible
  class Coercer

    module Configurable

      # @api private
      def self.extended(coercer)
        coercer.accept_options :config_keys
        super
      end

      # @api public
      def config(&block)
        configuration = Configuration.build(config_keys)
        yield configuration
        configuration
      end

      # @api public
      def config_name
        self.name.downcase.split('::').last.to_sym
      end

    end # module Configurable

  end # class Coercer
end # module Coercible
