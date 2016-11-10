module Bitrix24CloudApi
  module CRM
    class LiveFeedMessage < Bitrix24CloudApi::Base
      class << self
        def add(client, query = {})
          client.make_post_request(resource_url(client, __method__), query)
        end
      end
    end
  end
end
