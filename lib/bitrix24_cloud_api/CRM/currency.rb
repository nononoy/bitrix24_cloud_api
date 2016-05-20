module Bitrix24CloudApi
  module CRM
    module CURRENCY
      def self.const_missing(c)
        if c == :Localizations
          target_class = Bitrix24CloudApi::CRM.const_get(c)
          target_class.define_singleton_method(:resource_path) { "crm.currency.#{c.downcase}" }
          target_class
        end
      end
    end

    class Currency < Bitrix24CloudApi::Crm
    end
  end
end
