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

  class ValidationException < StandardError
    def initialize(invalid_attributes)
      @invalid_attributes = invalid_attributes
      super(message)
    end

    def message
      "The following attributes need to be present: #{@invalid_attributes.inspect}"
    end
  end

  class InvalidAttributeException < StandardError
    def initialize(invalid_attributes)
      @invalid_attributes = invalid_attributes
      super(message)
    end

    def message
      "The following attributes are invalid: #{@invalid_attributes.inspect}"
    end
  end

  class InvalidResourceException < StandardError
    def initialize(name)
      @name = name
    end

    def message
      "Resource #{@name} we received is unkown and might need to
        be implemented, go to https://github.com/exactonline/exactonline-api-ruby-client
        and open an issue or pull request"
    end
  end

  class UnauthorizedException < StandardError; end
end
