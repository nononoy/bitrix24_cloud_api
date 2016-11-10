module Bitrix24CloudApi
  module CRM
    class ProductRow < Bitrix24CloudApi::Base
      [:list, :fields].each do |action|
        define_singleton_method(action) do |client, query = {}|
          client.make_get_request(resource_url(client, action), query)
        end
      end
    end
  end
end
