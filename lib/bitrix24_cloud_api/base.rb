module Bitrix24CloudApi
  require 'forwardable'

  class Base
    require "httparty"
    extend Forwardable
    def_delegators 'self.class', :to_query, :query_path, :resource_url

    class << self

      def resource_url(client, action)
        "#{client.api_endpoint + resource_path}.#{action}.json"
      end

      def to_query(params)
        #TODO Add array to_query
        params.to_a.map { |x| "#{CGI.escape(x[0].to_s)}=#{CGI.escape(x[1].to_s)}" }.join("&")
      end

      def resource_path
        name.gsub("Bitrix24CloudApi::", "").gsub("::", ".").downcase
      end
    end

  end
end
