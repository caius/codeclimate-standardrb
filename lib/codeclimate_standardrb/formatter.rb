# frozen_string_literal: true

require "standard/formatter"
require "json"

module CodeclimateStandardrb
  class Formatter < RuboCop::Formatter::BaseFormatter
    def file_finished(file, offenses)
      return unless (uncorrected_offenses = offenses.reject(&:corrected?)).any?
      relative_path = Pathname.new(file).relative_path_from(base_directory)

      uncorrected_offenses.each do |o|
        output.puts({path: relative_path, line: o.line, column: o.real_column, message: o.message}.to_json)
      end
    end

    private

    def base_directory
      @base_directory ||= Pathname.new(Dir.pwd).freeze
    end
  end
end
