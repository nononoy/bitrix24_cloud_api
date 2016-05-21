module Bitrix24CloudApi
  module CRM
    class ProductRows < Bitrix24CloudApi::Crm
      class << self
        undef_method :add, :delete, :update

        def set(client, query = {})
          client.make_post_request(resource_url(client, __method__), query)
        end
      end
    end

    class Userfield < Bitrix24CloudApi::Crm
      class << self
        undef_method :fields

        def types(client)
          client.make_get_request(resource_url(client, __method__), query)
        end
      end
    end

    class Localizations < Bitrix24CloudApi::Crm
      class << self
        undef_method :delete, :fields, :get

        def set(client)
          client.make_post_request(resource_url(client, __method__), query)
        end
      end
    end

    class Communication < Bitrix24CloudApi::Crm
      class << self
        undef_method :add, :delete, :update, :get, :list
      end
    end
  end
end

