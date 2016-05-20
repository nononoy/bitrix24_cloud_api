module Bitrix24CloudApi
  module CRM
    module LEAD
      def self.const_missing(c)
        if [:Userfield, :ProductRows].any?{|x| x == c}
          target_class = Bitrix24CloudApi::CRM.const_get(c)
          target_class.define_singleton_method(:resource_path) { "crm.lead.#{c.downcase}" }
          target_class
        end
      end
    end

    class Lead < Bitrix24CloudApi::Crm
    end
  end
end
