require 'httparty'
require 'oga'

module Tessitura
  class PriceType < Struct.new(:xml_data)
    include AttrAccessorOfType

    attr_accessor :doc

    attr_accessor_of_type :category, type: String
    attr_accessor_of_type :def_price_type, type: TrueClass
    attr_accessor_of_type :description, type: String
    attr_accessor_of_type :price_type, type: Integer
    attr_accessor_of_type :promo, type: TrueClass
    attr_accessor_of_type :promo_max, type: Integer
    attr_accessor_of_type :promo_override_default, type: TrueClass
    attr_accessor_of_type :promo_rank, type: Integer
    attr_accessor_of_type :short_desc, type: String

    def initialize(xml_data)
      super(xml_data)
      self.doc = Oga.parse_xml(xml_data)
    end

    def id
      return unless att = doc.at_xpath('//PriceType').attribute('diffgr:id')
      att.value
    end
  end
end
