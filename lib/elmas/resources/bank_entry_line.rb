# frozen_string_literal: true

module Elmas
  class BankEntryLine
    # A sales entry line belongs to a sales entry
    include Elmas::Resource

    def base_path
      "financialtransaction/BankEntryLines"
    end

    def mandatory_attributes
      %i[amount_FC GL_account entry_ID our_ref account description date]
    end

    def other_attributes
      %i[
        amount_VATFC asset cost_center cost_unit notes document exchange_rate
        project quantity VAT_code VAT_percentage VAT_type
      ]
    end
  end
end
