module Coercible
  class Coercer

    # Coerce Fixnum values
    class Integer < Numeric
      # TODO: switch it back to Integer
      primitive ::Fixnum

      attr_reader :boolean_map

      def initialize(*)
        super
        @boolean_map = { 0 => false, 1 => true }
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
        # FIXME: Remove after Rubinius 2.0 is released
        if defined?(RUBY_ENGINE) && RUBY_ENGINE == 'rbx'
          datetime_format = '%Q'
          value = "#{value * 10**3}"
        else
          datetime_format = '%s'
          value = "#{value}"
        end

        ::DateTime.strptime(value, datetime_format)
      end

    end # class Fixnum

  end # class Coercer
end # module Coercible
