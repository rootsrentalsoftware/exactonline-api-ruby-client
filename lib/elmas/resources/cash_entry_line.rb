module Elmas
  class CashEntryLine < Elmas::BaseEntryLine
    # A sales entry line belongs to a sales entry
    include Elmas::Resource

    def base_path
      "financialtransaction/CashkEntryLines"
    end

    def other_attributes
      [
        :account, :amount_VATFC, :asset, :cost_center, :cost_unit, :date,
        :description, :notes, :document, :exchange_rate, :our_ref,
        :project, :quantity, :VAT_code, :VAT_percentage, :VAT_type
      ]
    end
  end
end
