module Bitrix24CloudApi
  require 'forwardable'

  class Base
    require "httparty"
    extend Forwardable
    def_delegators 'self.class', :resource_url

    class << self

      def resource_url(client, action)
        "#{client.api_endpoint + resource_path}.#{action}.#{client.extension}"
      end

      def resource_path
        name.gsub("Bitrix24CloudApi::", "").gsub("::", ".").downcase
      end
    end
  end
end
