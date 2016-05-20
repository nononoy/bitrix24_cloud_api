module Bitrix24CloudApi
  require 'forwardable'

  class Base
    extend Forwardable

    class << self

      def resource_url(client, action)
        "#{client.initial_path + resource_path}.#{action}.json"
      end

      def to_query(params)
        params.to_a.map { |x| "#{CGI.escape(x[0].to_s)}=#{CGI.escape(x[1].to_s)}" }.join("&")
      end

      def query_path(path, query)
        path + (query.any? ? "?#{to_query(query)}" : "")
      end

      def resource_path
        name.gsub("Bitrix24CloudApi::", "").gsub("::", ".").downcase
      end
    end

  end
end
