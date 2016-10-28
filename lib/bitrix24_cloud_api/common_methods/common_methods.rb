module Bitrix24CloudApi
  module COMMON_METHODS
    class User < Base
      [:admin, :access, :get].each do |action|
        define_singleton_method(action) do |client, query = {}|
          client.make_get_request(resource_url(client, action), query)
        end
      end

      class << self
        def resource_path
          "user"
        end
      end
    end

    class App < Base
      class << self

        def info(client)
          client.make_get_request(resource_url(client, __method__))
        end

        def resource_path
          "app"
        end
      end
    end

    class Event < Base
      [:bind, :unbind, :get].each do |action|
        define_singleton_method(action) do |client, query = {}|
          client.make_get_request(resource_url(client, action), query)
        end
      end

      class << self
        def resource_path
          "event"
        end
      end
    end
  end

  class CommonMethods < Base
    METHODS_SCOPE = [:methods, :scope, :batch, :access_name, :events]

    METHODS_SCOPE.each do |action|
      define_singleton_method(action) do |client, query = {}|
        client.make_get_request(resource_url(client, action), query)
      end
    end

    class << self
      def resource_path
        name = super
        name.gsub("commonmethods", "")
      end
    end
  end
end

