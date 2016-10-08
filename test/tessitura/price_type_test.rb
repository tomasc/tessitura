require 'test_helper'

module Tessitura
  describe PriceType do
    let(:sample_xml) do
      %(<?xml version="1.0" encoding="UTF-8"?>
        <DataSet xmlns="http://tessiturasoftware.com/">
          <diffgr:diffgram xmlns:msdata="urn:schemas-microsoft-com:xml-msdata" xmlns:diffgr="urn:schemas-microsoft-com:xml-diffgram-v1">
            <GetPerformanceDetailResult xmlns="">
              <PriceType diffgr:id="PriceType1" msdata:rowOrder="0">
                <category>Standard</category>
                <def_price_type>Y</def_price_type>
                <description>Perf Full Price Web</description>
                <price_type>44</price_type>
                <promo>Y</promo>
                <promo_max>9</promo_max>
                <promo_override_default>N</promo_override_default>
                <promo_rank>0</promo_rank>
                <short_desc>FPWEB</short_desc>
              </PriceType>
            </GetPerformanceDetailResult>
          </diffgr:diffgram>
        </DataSet>)
    end

    subject { PriceType.new(sample_xml) }

    it { subject.id.must_equal 'PriceType1' }

    it { subject.category.must_equal 'Standard' }
    it { subject.def_price_type.must_equal true }
    it { subject.description.must_equal 'Perf Full Price Web' }
    it { subject.price_type.must_equal 44 }
    it { subject.promo.must_equal true }
    it { subject.promo_max.must_equal 9 }
    it { subject.promo_override_default.must_equal false }
    it { subject.promo_rank.must_equal 0 }
    it { subject.short_desc.must_equal 'FPWEB' }
  end
end
