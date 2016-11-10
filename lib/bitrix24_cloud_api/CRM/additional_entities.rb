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

    class Localizations < Bitrix24CloudApi::Crm
      class << self
        def set(client, query = {})
          client.make_post_request(resource_url(client, __method__), query)
        end
      end
    end

    class Communication < Bitrix24CloudApi::Base
      class << self
        def fields(client, query = {})
          client.make_get_request(resource_url(client, __method__), query)
        end
      end
    end

    class Multifield < Bitrix24CloudApi::Base
      class << self
        def fields(client, query = {})
          client.make_get_request(resource_url(client, __method__), query)
        end
      end
    end

    class Duplicate < Bitrix24CloudApi::Base
      [:findbycomm].each do |action|
        define_singleton_method(action) do |client, query = {}|
          client.make_get_request(resource_url(client, action), query)
        end
      end
    end

    class Stage < Bitrix24CloudApi::Base
      [:list, :fields].each do |action|
        define_singleton_method(action) do |client, query = {}|
          client.make_get_request(resource_url(client, action), query)
        end
      end
    end

    class Enum < Bitrix24CloudApi::Base
      [:ownertype, :contenttype, :activitytype, :activitypriority, :activitydirection,
       :activitynotifytype, :fields].each do |action|
        define_singleton_method(action) do |client, query = {}|
          client.make_get_request(resource_url(client, action), query)
        end
      end
    end

    class Settings < Bitrix24CloudApi::Base
      class << self
        def fields(client, query = {})
          client.make_get_request(resource_url(client, __method__), query)
        end
      end
    end

    class Enumeration < Bitrix24CloudApi::Base
      class << self
        def fields(client, query = {})
          client.make_get_request(resource_url(client, __method__), query)
        end
      end
    end

    class Paysystem < Bitrix24CloudApi::Base
      [:list, :fields].each do |action|
        define_singleton_method(action) do |client, query = {}|
          client.make_get_request(resource_url(client, action), query)
        end
      end
    end

    class PersonType < Bitrix24CloudApi::Base
      [:list, :fields].each do |action|
        define_singleton_method(action) do |client, query = {}|
          client.make_get_request(resource_url(client, action), query)
        end
      end
    end

    class Entity < Bitrix24CloudApi::Base
      [:types, :items].each do |action|
        define_singleton_method(action) do |client, query = {}|
          client.make_get_request(resource_url(client, action), query)
        end
      end
    end
  end
end

