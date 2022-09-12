# frozen_string_literal: true

module Elmas
  class Me
    include Elmas::Resource

    def base_path
      "Current/Me"
    end

    def mandatory_attributes
      []
    end

    def other_attributes
      %i[
        current_division division_customer division_customer_code current_division full_name user_ID user_name language_code
        legislation email title first_name last_name gender language phone division_customer_name division_customer_vat_number
        division_customer_siret_number dossier_division accounting_division is_my_firm_portal_user is_client_user picture_url
        thumbnail_picture thumbnail_picture_format initials middle_name nationality phone_extension mobile server_time
        server_utc_offset employee_ID
      ]
    end
  end
end
