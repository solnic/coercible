module Coercible
  class Coercer

    # Coerce Fixnum values
    class Integer < Numeric
      extend Configurable

      primitive ::Integer

      config_keys [ :datetime_format, :datetime_proc, :boolean_map ]

      # @api public
      def self.config
        # FIXME: Remove after Rubinius 2.0 is released
        is_rbx = defined?(RUBY_ENGINE) && RUBY_ENGINE == 'rbx'

        super do |config|
          config.datetime_format = is_rbx ? '%Q' : '%s'

          config.datetime_proc   = is_rbx ?
            Proc.new { |value| "#{value * 10**3}" } : Proc.new { |value| "#{value}" }

          config.boolean_map = { 0 => false, 1 => true }
        end
      end

      # @api private
      attr_reader :datetime_format, :datetime_proc, :boolean_map

      def initialize(coercer = Coercer.new, config = self.class.config)
        super(coercer)
        @boolean_map     = config.boolean_map
        @datetime_format = config.datetime_format
        @datetime_proc   = config.datetime_proc
      end

      # Coerce given value to String
      #
      # @example
      #   Coercible::Coercion::Fixnum.to_string(1)  # => "1"
      #
      # @param [Fixnum] value
      #
      # @return [String]
      #
      # @api public
      def to_string(value)
        value.to_s
      end

      # Passthrough the value
      #
      # @example
      #   Coercible::Coercion::Fixnum.to_integer(1)  # => 1
      #
      # @param [Fixnum] value
      #
      # @return [Float]
      #
      # @api public
      def to_integer(value)
        value
      end

      # Coerce given value to a Boolean
      #
      # @example with a 1
      #   Coercible::Coercion::Fixnum.to_boolean(1)  # => true
      #
      # @example with a 0
      #   Coercible::Coercion::Fixnum.to_boolean(0)  # => false
      #
      # @param [Fixnum] value
      #
      # @return [BigDecimal]
      #
      # @api public
      def to_boolean(value)
        boolean_map.fetch(value) { raise(ArgumentError) }
      end

      # Coerce given value to a DateTime
      #
      # @example
      #   Coercible::Coercion::Fixnum.to_datetime(0)  # => Thu, 01 Jan 1970 00:00:00 +0000
      #
      # @param [Integer] value
      #
      # @return [DateTime]
      #
      # @api public
      def to_datetime(value)
        ::DateTime.strptime(datetime_proc.call(value), datetime_format)
      end

    end # class Fixnum

  end # class Coercer
end # module Coercible
