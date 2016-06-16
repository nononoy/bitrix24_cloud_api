$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'bitrix24_cloud_api'
require 'webmock/rspec'

WebMock.disable_net_connect!(allow_localhost: true)
RSpec.configure do |config|
  config.before(:example) { @client = Bitrix24CloudApi::Client.new(endpoint: "test.bitrix24.ua",
                                                                  access_token: "brzrk6nt5r5d4s331bfj490rw904w2du",
                                                                  scope: "all",
                                                                  extension: "json",
                                                                  redirect_uri: "https://test.bitrix24.ua",
                                                                  client_id: "app.57398fd61b13c1.73498509",
                                                                  client_secret: "f06tTB1ysP4GLMS9AX3os7TcUP0BqMjQgvFgklRpyt7RVyu4Bx") }
end