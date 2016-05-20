module Bitrix24CloudApi
  module CRM
    module CONTACT
      def self.const_missing(c)
        if c == :Userfield
          target_class = Bitrix24CloudApi::CRM.const_get(c)
          target_class.define_singleton_method(:resource_path) { "crm.contact.#{c.downcase}" }
          target_class
        end
      end
    end

    class Contact < Bitrix24CloudApi::Crm
    end
  end
end
