module Elmas
  class Parser
    def initialize(json)
      @object = JSON.parse(json)
    rescue JSON::ParserError => e
      Elmas.error("There was an error parsing the response, #{e.message}")
      @error_message = e.message
      return false
    end

    def results
      @object["d"]["results"]
    end

    def error_message
      @error_message ||= @object["error"]["message"]["value"]
    end

    def first_result
      results[0]
    end
  end
end
