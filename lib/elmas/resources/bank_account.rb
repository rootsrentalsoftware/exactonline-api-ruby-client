module Elmas
  class BankAccount
    # An account needs a name
    include Elmas::Resource

    def valid_actions
      [:get]
    end

    def base_path
      "crm/BankAccounts"
    end

    def mandatory_attributes
      [:account]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=CRMAccounts
    def other_attributes # rubocop:disable Metrics/MethodLength
      [
        :id,
        :account,
        :account_name,
        :bank,
        :bank_account,
        :bank_description,
        :bank_name,
        :BIC_code,
        :description,
        :division,
        :format,
        :IBAN,
        :type,
        :type_description
      ]
    end
  end
end
