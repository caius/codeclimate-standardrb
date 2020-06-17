require "standard"

module CodeclimateStandardrb
  # Wrapper around Standard gem
  class Runner
    attr_reader :standard_runner

    def initialize
      @standard_runner = Standard::Cli.new(["--format=json", "/code"])
    end

    def run
      success = standard_runner.run

      # Only return 0/1 exit codes
      success.zero? ? 0 : 1
    end
  end
end
