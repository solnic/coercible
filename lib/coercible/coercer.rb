module Coercible

  class Coercer

    # @api private
    attr_reader :coercers

    # @api private
    attr_reader :config

    # @api public
    def self.new(&block)
      configuration = Configuration.build(config_keys)

      configurable_coercers.each do |coercer|
        configuration.send("#{coercer.config_key}=", coercer.config)
      end

      yield(configuration) if block_given?

      super({}, configuration)
    end

    # @api private
    def self.config_keys
      configurable_coercers.map(&:config_key)
    end
    private_class_method :config_keys

    # @api private
    def self.configurable_coercers(&block)
      Coercer::Object.descendants.select { |descendant|
        descendant.respond_to?(:config)
      }
    end
    private_class_method :configurable_coercers

    # @api private
    def initialize(coercers = {}, config = nil)
      @coercers = coercers
      @config   = config
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
      coercers[klass] =
        begin
          coercer = Coercer::Object.determine_type(klass) || Coercer::Object
          coercer.new(self, config_for(coercer))
        end
    end

    # @api private
    def initialize_default_coercer
      coercers[::Object] = Coercer::Object.new(self)
    end

    # @api private
    def config_for(coercer)
      config.send(coercer.config_key) if coercer.respond_to?(:config_key)
    end

  end # class Coercer

end # module Coercible
