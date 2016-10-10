require 'httparty'
require 'oga'

module Tessitura
  class Performance < Struct.new(:xml_data)
    include AttrAccessorOfType

    attr_accessor :doc

    attr_accessor_of_type :description
    attr_accessor_of_type :end_dt, type: DateTime
    attr_accessor_of_type :facility_desc
    attr_accessor_of_type :facility_no, type: Integer
    attr_accessor_of_type :ga_ind, type: TrueClass
    attr_accessor_of_type :inv_no, type: Integer
    attr_accessor_of_type :on_sale_ind, type: TrueClass
    attr_accessor_of_type :perf_dt, type: DateTime
    attr_accessor_of_type :perf_status, type: Integer
    attr_accessor_of_type :perf_status_desc
    attr_accessor_of_type :perf_type_id, type: Integer
    attr_accessor_of_type :performance_type
    attr_accessor_of_type :print_ind, type: TrueClass
    attr_accessor_of_type :prod_season_no, type: Integer
    attr_accessor_of_type :season_desc
    attr_accessor_of_type :season_no, type: Integer
    attr_accessor_of_type :seat_ind, type: TrueClass
    attr_accessor_of_type :start_dt, type: DateTime
    attr_accessor_of_type :time_slot, type: Integer
    attr_accessor_of_type :time_slot_desc
    attr_accessor_of_type :type
    attr_accessor_of_type :zmap_no, type: Integer

    alias facility_description facility_desc
    alias facility_number facility_no
    alias production_season_number prod_season_no
    alias season_description season_desc
    alias season_number season_no
    alias status perf_status
    alias status_description perf_status_desc
    alias tessitura_id inv_no

    def initialize(xml_data)
      super(xml_data)
      self.doc = Oga.parse_xml(xml_data).at_xpath('//Performance')
    end

    def id
      return unless att = doc.at_xpath('//Performance').attribute('diffgr:id')
      att.value
    end

    def all_prices
      doc.xpath('//AllPrice').map { |xml| AllPrice.new(xml.to_xml) }
    end

    def price_types
      doc.xpath('//PriceType').map { |xml| PriceType.new(xml.to_xml) }
    end
  end
end
