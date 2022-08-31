# frozen_string_literal: true

module Elmas
  class SalesInvoice
    # An sales_invoice usually has multiple sales_invoice lines
    # It should also have a journal id and a contact id who ordered it
    include Elmas::Resource
    include Elmas::SharedSalesAttributes

    def base_path
      "salesinvoice/SalesInvoices"
    end

    def mandatory_attributes
      %i[ordered_by invoice_date journal order_date order_number type your_ref]
    end

    def other_attributes
      SHARED_SALES_ATTRIBUTES.inject(
        %i[sales_invoice_lines due_date salesperson starter_sales_invoice_status],
        :<<
      )
    end
  end
end
