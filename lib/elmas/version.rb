# frozen_string_literal: true

module Elmas
  class Version
    MAJOR = 3
    MINOR = 0
    PATCH = 1

    class << self
      def to_s
        [MAJOR, MINOR, PATCH].compact.join(".")
      end
    end
  end
end
