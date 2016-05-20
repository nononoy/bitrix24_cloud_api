module Bitrix24CloudApi
  module CRM
    class Catalog < Bitrix24CloudApi::Crm
      class << self
        undef_method :add, :delete, :update
      end
    end
  end
end
