module Bitrix24CloudApi
  module CRM
    module USERFIELD
      def self.const_missing(c)
        if [:Settings, :Enumeration].any?{|x| x == c}
          target_class = Bitrix24CloudApi::CRM.const_get(c)
          target_class.define_singleton_method(:resource_path) { "crm.userfield.#{c.downcase}" }
          target_class
        end
      end
    end

    class Userfield < Bitrix24CloudApi::Crm
      class << self

        def types(client, query = {})
          client.make_get_request(resource_url(client, __method__), query)
        end
      end
    end
  end
end
