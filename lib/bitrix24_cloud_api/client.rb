module Bitrix24CloudApi

  class Client < Base
    require 'oauth2'

    attr_reader :endpoint, :access_token, :redirect_uri, :client_id, :client_secret, :scope, :oauth2client
    attr_writer :access_token

    def initialize(attrs = {})
      @endpoint =     attrs[:endpoint]
      @access_token = attrs[:access_token]
      @client_id = attrs[:client_id]
      @client_secret = attrs[:client_secret]
      @redirect_uri = attrs[:redirect_uri]
      @scope = attrs[:scope]
      if @client_id.length > 0 && @client_secret.length > 0
        @oauth2client = OAuth2::Client.new(@client_id, @client_secret, :site => api_endpoint)
      end
    end

    def api_endpoint
      "https://#{endpoint}/rest/"
    end

    def authorize_url
      oauth2client.auth_code.authorize_url(:redirect_uri => redirect_uri)
    end

    def get_access_token(code)
      auth_token_query = {}
      auth_token_query[:client_id] = client_id
      auth_token_query[:client_secret] = client_secret
      auth_token_query[:grant_type] = "authorization_code"
      auth_token_query[:scope] = scope
      auth_token_query[:redirect_uri] = redirect_uri
      auth_token_path = oauth2client.options[:token_url] + "?#{to_query(auth_token_query)}"
      oauth2client.options[:token_url] = auth_token_path

      begin
        token = oauth2client.auth_code.get_token(code, :redirect_uri => redirect_uri)
        token.params.merge({:access_token => token.token,
                            :refresh_token => token.refresh_token,
                            :expires_at => token.expires_at})
      rescue OAuth2::Error
        return nil
      end
    end

    def refresh_token(refresh_token_hash)
      auth_token_query = {}
      auth_token_query[:client_id] = client_id
      auth_token_query[:client_secret] = client_secret
      auth_token_query[:grant_type] = 'refresh_token'
      auth_token_query[:refresh_token] = refresh_token_hash
      auth_token_path = "/oauth/token?#{to_query(auth_token_query)}"
      oauth2client.options[:token_url] = auth_token_path

      begin
        token = oauth2client.get_token(auth_token_query)
        token.params.merge({:access_token => token.token,
                            :refresh_token => token.refresh_token,
                            :expires_at => token.expires_at})
      rescue OAuth2::Error
        return false
      end
    end

    def make_get_request(path, params = {})
      params.merge!(auth: access_token)
      HTTParty.get([path, to_query(params)].join("?"))
    end

    def make_post_request(path, params = {})
      params.merge!(auth: access_token)
      HTTParty.post([path, to_query(params)].join("?"))
    end

    class << self

      def create_sample
        Bitrix24CloudApi::Client.new(endpoint: "istattest.bitrix24.ua",
                                     access_token: "pbx05nscq3opj3m5lrhfvlmkoylwrrlo",
                                     scope: "crm",
                                     redirect_uri: "https://istattest.bitrix24.ua",
                                     client_id: "app.57398fd61b13c1.73498508",
                                     client_secret: "f06tTB1ysP4GLMS9AX3os7TcUP0BqMjQgvFgklRpyt7RVyu4BX")
      end
    end
  end
end
