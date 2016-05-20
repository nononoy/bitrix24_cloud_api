module Bitrix24CloudApi

  class Client < Base

    attr_reader :endpoint, :access_token

    def initialize(attrs = {})
      @endpoint =     attrs[:endpoint]
      @access_token = attrs[:access_token]
    end

    def initial_path
      "https://#{endpoint}/rest/"
    end

    class << self
      def create_sample
        Bitrix24CloudApi::Client.new(endpoint: "istattest.bitrix24.ua", access_token: "pbx05nscq3opj3m5lrhfvlmkoylwrrlo")
      end
    end

  end
end
