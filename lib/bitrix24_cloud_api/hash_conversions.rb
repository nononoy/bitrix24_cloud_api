module Bitrix24CloudApi
  module HashConversions

    def self.to_params(hash)
      hash.to_hash.map { |k, v| normalize_param(k, v) }.join.chop
    end

    def self.normalize_param(key, value)
      param = ''
      stack = []

      if value.respond_to?(:to_ary)
        param << if value.empty?
                   "#{key}[]=&"
                 else
                   value.to_ary.map.with_index { |element, index| normalize_param("#{key}[#{index}]", element) }.join
                 end
      elsif value.respond_to?(:to_hash)
        stack << [key, value.to_hash]
      else
        param << "#{key}=#{ERB::Util.url_encode(value.to_s)}&"
      end

      stack.each do |parent, hash|
        hash.each do |k, v|
          if v.respond_to?(:to_hash)
            stack << ["#{parent}[#{k}]", v.to_hash]
          else
            param << normalize_param("#{parent}[#{k}]", v)
          end
        end
      end

      param
    end
  end
end