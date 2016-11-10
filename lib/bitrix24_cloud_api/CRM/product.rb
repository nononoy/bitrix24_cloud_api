module Bitrix24CloudApi
  module CRM
    module PRODUCT
      module PROPERTY
        def self.const_missing(c)
          if [:Settings, :Enumeration].any?{|x| x == c}
            target_class = Bitrix24CloudApi::CRM.const_get(c)
            target_class.define_singleton_method(:resource_path) { "crm.product.property.#{c.downcase}" }
            target_class
          end
        end
      end

      def self.const_missing(c)
        if c == :Property
          target_class = Bitrix24CloudApi::CRM.const_get(c)
          target_class.define_singleton_method(:resource_path) { "crm.product.#{c.downcase}" }
          target_class
        end
      end
    end

    class Product < Bitrix24CloudApi::Crm
    end
  end
end
