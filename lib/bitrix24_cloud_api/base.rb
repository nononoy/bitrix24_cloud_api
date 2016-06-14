module Bitrix24CloudApi
  require 'forwardable'

  class Base
    require "httparty"
    extend Forwardable
    def_delegators 'self.class', :resource_url, :to_query

    class << self

      def to_query(params)
        params.to_a.map { |x| "#{CGI.escape(x[0].to_s)}=#{CGI.escape(x[1].to_s)}" }.join("&")
      end

      def resource_url(client, action)
        path = client.api_endpoint
        path << "#{resource_path}." unless resource_path.empty?
        path << "#{action}.#{client.extension}"
      end

      def resource_path(exact_name = nil)
        exact_name || name.gsub("Bitrix24CloudApi::", "").gsub("::", ".").downcase
      end
    end
  end
end
