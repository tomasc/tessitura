require 'httparty'
require 'oga'

module Tessitura
  class AllPrice < Struct.new(:xml_data)
    include AttrAccessorOfType

    attr_accessor :doc

    attr_accessor_of_type :avail_count, type: Integer
    attr_accessor_of_type :available, type: TrueClass
    attr_accessor_of_type :base_price, type: Float
    attr_accessor_of_type :def_price_type, type: Integer
    attr_accessor_of_type :description
    attr_accessor_of_type :price, type: Float
    attr_accessor_of_type :price_type, type: Integer
    attr_accessor_of_type :price_type_desc
    attr_accessor_of_type :rank, type: Integer
    attr_accessor_of_type :zone_no, type: Integer

    def initialize(xml_data)
      super(xml_data)
      self.doc = Oga.parse_xml(xml_data)
    end

    def id
      return unless att = doc.at_xpath('//AllPrice').attribute('diffgr:id')
      att.value
    end

    def sold_out
      !available?
    end
    alias sold_out? sold_out
  end
end
