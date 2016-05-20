module Bitrix24CloudApi
  module CRM
    module QUOTE
      def self.const_missing(c)
        if [:Userfield, :ProductRows].any?{|x| x == c}
          target_class = Bitrix24CloudApi::CRM.const_get(c)
          target_class.define_singleton_method(:resource_path) { "crm.quote.#{c.downcase}" }
          target_class
        end
      end
    end

    class Quote < Bitrix24CloudApi::Crm
    end
  end
end
