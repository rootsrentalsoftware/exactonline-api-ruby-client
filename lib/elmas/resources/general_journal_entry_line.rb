# frozen_string_literal: true

module Elmas
  class GeneralJournalEntryLine
    include Elmas::Resource

    def base_path
      "generaljournalentry/GeneralJournalEntryLines"
    end

    def mandatory_attributes
      %i[amount_FC GL_account entry_ID description date]
    end

    def other_attributes
      %i[
        serial_number asset cost_center cost_unit notes
        project quantity serial_number subscription tracking_number
        VAT_amount_FC VAT_base_amount_DC VAT_base_amount_FC VAT_code
        VAT_percentage account
      ]
    end
  end
end
