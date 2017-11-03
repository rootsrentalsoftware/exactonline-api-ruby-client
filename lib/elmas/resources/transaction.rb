# frozen_string_literal: true

module Elmas
  class Transaction
    include Elmas::Resource

    def valid_actions
      [:get]
    end

    def base_path
      "financialtransaction/Transactions"
    end

    def mandatory_attributes
      []
    end

    def other_attributes
      [:description]
    end
  end
end
