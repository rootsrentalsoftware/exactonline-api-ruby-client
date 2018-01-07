module Elmas
  class GoodsDelivery
    include Elmas::Resource
    include Elmas::SharedSalesAttributes

    def base_path
      "salesorder/GoodsDeliveries"
    end

    def mandatory_attributes
      [:goods_delivery_lines]
    end

    def other_attributes
      SHARED_SALES_ATTRIBUTES.inject(
        [
          :delivery_account, :delivery_account_code, :delivery_account_name,
          :delivery_address, :delivery_contact, :delivery_contact_person_full_name,
          :delivery_date, :delivery_number,
          :shipping_method, :shipping_method_code, :shipping_method_description,
          :tracking_number, :warehouse, :warehouse_code, :warehouse_description
        ],
        :<<
      )
    end
  end
end
