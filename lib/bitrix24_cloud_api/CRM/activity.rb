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
      [:company, :contact].each do |action|
        define_singleton_method(action) do |client, query = {}|
          client.make_post_request(resource_url(client, action), query)
        end
      end
    end
  end
end
