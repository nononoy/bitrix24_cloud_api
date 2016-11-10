module Bitrix24CloudApi
  module CRM
    module REQUISITE
      module PRESET
        class Field < Bitrix24CloudApi::Crm
          class << self
            def availabletoadd(client, query = {})
              client.make_get_request(resource_url(client, __method__), query)
            end
          end
        end
      end

      def self.const_missing(c)
        if [:Userfield].any?{|x| x == c}
          target_class = Bitrix24CloudApi::CRM.const_get(c)
          target_class.define_singleton_method(:resource_path) { "crm.requisite.#{c.downcase}" }
          target_class
        end
      end

      class Bankdetail < Bitrix24CloudApi::Crm
      end

      class Link < Bitrix24CloudApi::Base
        [:fields, :get, :list].each do |action|
          define_singleton_method(action) do |client, query = {}|
            client.make_get_request(resource_url(client, action), query)
          end
        end

        [:register, :unregister].each do |action|
          define_singleton_method(action) do |client, query = {}|
            client.make_post_request(resource_url(client, action), query)
          end
        end
      end

      class Preset < Bitrix24CloudApi::Crm
        class << self
          def countries(client, query = {})
            client.make_get_request(resource_url(client, __method__), query)
          end
        end
      end
    end

    class Requisite < Bitrix24CloudApi::Crm
      class << self
        undef_method :update
      end
    end
  end
end
