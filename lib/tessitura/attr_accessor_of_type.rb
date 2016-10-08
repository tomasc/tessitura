module Tessitura
  module AttrAccessorOfType
    def self.included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods
      def attr_accessor_of_type(name, options = {})
        xpath = options.fetch :xpath, "//#{name}"
        type = options.fetch :type, String

        define_method name do
          return unless el = doc.at_xpath(xpath)
          case type.to_s
          when 'Integer' then el.text.to_i
          when 'Float' then el.text.to_f
          when 'DateTime' then DateTime.parse(el.text)
          when 'TrueClass' then el.text == 'Y'
          else el.text
          end
        end

        alias_method("#{name}?".to_sym, name) if type == TrueClass
      end
    end
  end
end
