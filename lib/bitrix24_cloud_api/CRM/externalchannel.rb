module Bitrix24CloudApi
  module CRM
    module EXTERNALCHANNEL
      def self.const_missing(c)
        if c == :Activity
          target_class = Bitrix24CloudApi::CRM.const_get(c)
          target_class.define_singleton_method(:resource_path) { "crm.externalchannel.#{c.downcase}" }
          target_class
        end
      end

      class Connector < Bitrix24CloudApi::Base
        class << self
          def register(client, query = {})
            client.make_post_request(resource_url(client, __method__), query)
          end
        end
      end
    end

    class Externalchannel < Bitrix24CloudApi::Base

      [:company, :contact].each do |action|
        define_singleton_method(action) do |client, query = {}|
          client.make_get_request(resource_url(client, action), query)
        end
      end
    end
  end
end
