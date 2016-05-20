module Bitrix24CloudApi
  module CRM
    module DEAL
      def self.const_missing(c)
        puts c
        if [:Userfield, :ProductRows].any?{|x| x == c}
          target_class = Bitrix24CloudApi::CRM.const_get(c)
          target_class.define_singleton_method(:resource_path) { "crm.deal.#{c.downcase}" }
          target_class
        end
      end
    end

    class Deal < Bitrix24CloudApi::Crm

      [:types, :set].each do |each|
        define_singleton_method(each) { |client| resource_url(client, action = each) }
      end
    end
  end
end
