module Bitrix24CloudApi
  module CRM
    class Property < Bitrix24CloudApi::Crm
      class << self
        def types(client, query = {})
          client.make_get_request(resource_url(client, __method__), query)
        end
      end
    end
  end
end
