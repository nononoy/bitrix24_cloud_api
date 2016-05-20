module Bitrix24CloudApi
  module CRM
    module ACTIVITY
      def self.const_missing(c)
        if :Communication == c
          target_class = Bitrix24CloudApi::CRM.const_get(c)
          target_class.define_singleton_method(:resource_path) { "crm.activity.#{c.downcase}" }
          target_class
        end
      end
    end

    class Activity < Bitrix24CloudApi::Crm
    end
  end
end
