require 'benchmark/ips'
require 'coercible'

COERCER = Coercible::Coercer.new

Benchmark.ips do |benchmark|
  benchmark.time = 30
  benchmark.warmup = 30

  benchmark.report(:cached_unsupported_coercion_error) do |times|
    ENV['COERCIBLE_CACHE_UNSUPPORTED_COERCION_ERROR'] = '1'

    i = 0
    while i < times
      begin
        COERCER[String].to_string(nil)
      rescue ::Coercible::UnsupportedCoercion
        :ignore
      end

      i += 1
    end
  end

  benchmark.report(:noncached_unsupported_coercion_error) do |times|
    ENV['COERCIBLE_CACHE_UNSUPPORTED_COERCION_ERROR'] = nil

    i = 0
    while i < times
      begin
        COERCER[String].to_string(nil)
      rescue ::Coercible::UnsupportedCoercion
        :ignore
      end

      i += 1
    end
  end

  benchmark.compare!
end
