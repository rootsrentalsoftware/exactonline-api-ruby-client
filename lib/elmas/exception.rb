# frozen_string_literal: true

module Elmas
  class BadRequestException < StandardError
    def initialize(response, parsed)
      @response = response
      @parsed = parsed
      super(message)
    end

    def message
      if @parsed.error_message.present?
        "code #{@response.status}: #{@parsed.error_message}"
      else
        @response.inspect
      end
    end
  end

  class UnauthorizedException < StandardError; end

  class ValidationException < StandardError
    def initialize(invalid_attributes)
      @invalid_attributes = invalid_attributes
      super(message)
    end

    def message
      "The following attributes need to be present: #{@invalid_attributes.inspect}"
    end
  end
end
