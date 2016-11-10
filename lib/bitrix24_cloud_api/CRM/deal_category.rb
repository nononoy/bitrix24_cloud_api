module Bitrix24CloudApi
  module CRM
    module DEAL_CATEGORY
      def self.const_missing(c)
        if c == :Stage
          target_class = Bitrix24CloudApi::CRM.const_get(c)
          target_class.define_singleton_method(:resource_path) { "crm.dealcategory.#{c.downcase}" }
          target_class
        end
      end
    end

    class DealCategory < Bitrix24CloudApi::Crm

      [:status].each do |action|
        define_singleton_method(action) do |client, query = {}|
          client.make_get_request(resource_url(client, action), query)
        end
      end
    end
  end
end
