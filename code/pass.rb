# frozen_string_literal: true

require "time"

class Pass
  def self.call
    new.call
  end

  attr_reader :created_at

  def initialize
    @created_at = Time.now
  end

  def call
    return unless acceptable_version?

    puts "#{created_at} Pass"
  end

  private

  def acceptable_version?
    RUBY_VERSION.include?(".")
  end
end

if $0 == __FILE__
  Pass.call
end
