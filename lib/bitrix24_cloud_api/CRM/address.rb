module Bitrix24CloudApi
  module CRM
    class Address < Bitrix24CloudApi::Crm
      class << self
        undef_method :get
      end
    end
  end
end
