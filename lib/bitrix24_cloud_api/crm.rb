module Bitrix24CloudApi

  class Crm < Base

   [:add, :delete, :update].each do |action|
     define_singleton_method(action) do |client, query = {}|
       client.make_post_request(resource_url(client, action), query)
     end
   end

   [:get, :list, :fields].each do |action|
     define_singleton_method(action) do |client, query = {}|
       client.make_get_request(resource_url(client, action), query)
     end
   end
  end
end

require "bitrix24_cloud_api/CRM/additional_entities"
require "bitrix24_cloud_api/CRM/address"
require "bitrix24_cloud_api/CRM/activity"
require "bitrix24_cloud_api/CRM/catalog"
require "bitrix24_cloud_api/CRM/company"
require "bitrix24_cloud_api/CRM/contact"
require "bitrix24_cloud_api/CRM/currency"
require "bitrix24_cloud_api/CRM/deal"
require "bitrix24_cloud_api/CRM/deal_category"
require "bitrix24_cloud_api/CRM/externalchannel"
require "bitrix24_cloud_api/CRM/invoice"
require "bitrix24_cloud_api/CRM/invoice_status"
require "bitrix24_cloud_api/CRM/lead"
require "bitrix24_cloud_api/CRM/live_feed_message"
require "bitrix24_cloud_api/CRM/measure"
require "bitrix24_cloud_api/CRM/product"
require "bitrix24_cloud_api/CRM/product_row"
require "bitrix24_cloud_api/CRM/product_section"
require "bitrix24_cloud_api/CRM/property"
require "bitrix24_cloud_api/CRM/requisite"
require "bitrix24_cloud_api/CRM/status"
require "bitrix24_cloud_api/CRM/vat"
require "bitrix24_cloud_api/CRM/quote"
require "bitrix24_cloud_api/CRM/userfield"