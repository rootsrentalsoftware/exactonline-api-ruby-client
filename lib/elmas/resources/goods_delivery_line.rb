module Elmas
  class GoodsDeliveryLine
    # TODO: Fill out mandatory and other attributes
    include Elmas::Resource
    include Elmas::SharedSalesAttributes

    def base_path
      "salesorder/GoodsDeliveryLines"
    end

    def mandatory_attributes
      [:delivery_date, :item, :line_number, :sales_order_number]
    end

    def other_attributes
      SHARED_LINE_ATTRIBUTES.inject(
        [
          :quantity_delivered, :quantity_ordered,
          :sales_order_line_id, :sales_order_line_number,
          :serial_numbers, :storage_location,
          :tracking_number, :unit_code 
        ],
        :<<
      )
    end

  end
end
