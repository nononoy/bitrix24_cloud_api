require 'spec_helper'

describe Bitrix24CloudApi::Client do

  def create_client_with_no_data
    @_client = Bitrix24CloudApi::Client.new(endpoint: "test.bitrix24.ua",
                                            scope: "all",
                                            extension: "json",
                                            redirect_uri: "https://test.bitrix24.ua")
  end

  describe ".api_endpoint" do
    it "returns correct REST API endpoint" do
      expect(@client.api_endpoint).to eq "https://#{@client.endpoint}/rest/"
    end
  end

  describe ".authorize_url" do
    it "returns nil if client_id or client_secret are not provided" do
      create_client_with_no_data
      expect(@_client.authorize_url.nil?).to be true
    end

    it "returns oauth2 authorize_url" do
      expect(@client.authorize_url.is_a? String).to be true
      expect(@client.authorize_url).to eq "https://#{@client.endpoint}/oauth/authorize?client_id=#{@client.client_id}" +
                                  "&redirect_uri=#{CGI.escape(@client.redirect_uri)}&response_type=code&state=true"
    end
  end

  describe ".get_access_token" do
    it "returns nil if client_id or client_secret are not provided" do
      create_client_with_no_data
      expect(@_client.get_access_token("sample_code").nil?).to be true
    end

    it "returns oauth2 access_token hash" do
      stub_request(:post, "#{Bitrix24CloudApi::Client::B24_OAUTH_ENDPOINT}?client_id=#{@client.client_id}&" +
                            "client_secret=#{@client.client_secret}&grant_type=authorization_code" +
                            "&code=sample_code").
          with(:body => {},
               :headers => {'Accept'=>'*/*',
                            'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
                            'Content-Type'=>'application/x-www-form-urlencoded',
                            'User-Agent'=>'Faraday v0.9.2'}).
          to_return(:status => 200, :body => {access_token: "sample"}.to_json,
                    headers: { 'Content-Type' => 'application/json' })

      expect(@client.get_access_token("sample_code").is_a? Hash).to be true
    end
  end

  describe ".refresh_token" do
    it "returns nil if client_id or client_secret are not provided" do
      create_client_with_no_data
      expect(@_client.refresh_token("sample_refresh_token").nil?).to be true
    end

    it "returns oauth2 refreshed_token hash" do
      stub_request(:post, "#{Bitrix24CloudApi::Client::B24_OAUTH_ENDPOINT}?client_id=#{@client.client_id}" +
                          "&client_secret=#{@client.client_secret}&grant_type=refresh_token" +
                          "&refresh_token=sample_refresh_token").
          with(:body => {},
               :headers => {'Accept'=>'*/*',
                            'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
                            'Content-Type'=>'application/x-www-form-urlencoded',
                            'User-Agent'=>'Faraday v0.9.2'}).
          to_return(:status => 200, :body => {access_token: "sample"}.to_json,
                    headers: { 'Content-Type' => 'application/json' })

      expect(@client.refresh_token("sample_refresh_token").is_a? Hash).to be true
    end
  end

  describe ".make_get_request" do
    let(:path) {"http://example.org/"}
    let(:query) { {foo: "bar"}}
    it "should successfully make a GET request" do
      stub_request(:get, "#{path}?auth=#{@client.access_token}&foo=bar").
          with(:headers => {'Accept'=>'*/*',
                            'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
                            'User-Agent'=>'Ruby'}).
          to_return(:status => 200, :body => {success: true}.to_json, :headers => {})

      expect(@client.make_get_request(path, query)).to include("success")
    end
  end

  describe ".make_post_request" do
    let(:path) {"http://example.org/"}
    let(:query) { {foo: "bar"}}
    it "should successfully make a POST request" do
      stub_request(:post, "#{path}?auth=#{@client.access_token}").
          with(:headers => {'Accept'=>'*/*',
                            'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
                            'User-Agent'=>'Ruby'}).
          to_return(:status => 200, :body => {success: true}.to_json, :headers => {})

      expect(@client.make_post_request(path, query)).to include("success")
    end
  end
end