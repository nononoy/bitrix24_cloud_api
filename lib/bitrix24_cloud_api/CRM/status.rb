module Bitrix24CloudApi
  module CRM
    module STATUS
      def self.const_missing(c)
        if c == :Entity
          target_class = Bitrix24CloudApi::CRM.const_get(c)
          target_class.define_singleton_method(:resource_path) { "crm.status.#{c.downcase}" }
          target_class
        end
      end
    end

    class Status < Bitrix24CloudApi::Crm
    end
  end
end
