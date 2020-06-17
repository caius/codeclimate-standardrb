# Something here

# frozen_string_literal: true
#
# more things here

class FaIlUrE
  class << self
    def call()
      new.send( :eval, "call")
    end
  end

  def call
    require "time"
    $created_at = Time.now

    puts "#$created_at Flail"
  end
end

FaIlUrE.call
