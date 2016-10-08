require 'test_helper'

module Tessitura
  describe AllPrice do
    let(:sample_xml) do
      %(<?xml version="1.0" encoding="UTF-8"?>
        <DataSet xmlns="http://tessiturasoftware.com/">
          <diffgr:diffgram xmlns:msdata="urn:schemas-microsoft-com:xml-msdata" xmlns:diffgr="urn:schemas-microsoft-com:xml-diffgram-v1">
            <GetPerformanceDetailResult xmlns="">
              <AllPrice diffgr:id="AllPrice3" msdata:rowOrder="2">
                <avail_count>82</avail_count>
                <available>Y</available>
                <base_price>30.0000</base_price>
                <def_price_type>44</def_price_type>
                <description>Standard</description>
                <price>24.0000</price>
                <price_type>48</price_type>
                <price_type_desc>Perf Performance Package Web</price_type_desc>
                <rank>1</rank>
                <zone_no>33</zone_no>
            </AllPrice>
          </GetPerformanceDetailResult>
        </diffgr:diffgram>
      </DataSet>)
    end

    subject { AllPrice.new(sample_xml) }

    it { subject.id.must_equal 'AllPrice3' }

    it { subject.available.must_equal true }
    it { subject.available?.must_equal true }
    it { subject.sold_out.must_equal false }
    it { subject.sold_out?.must_equal false }

    it { subject.avail_count.must_equal 82 }
    it { subject.base_price.must_equal 30.0000 }
    it { subject.def_price_type.must_equal 44 }
    it { subject.description.must_equal 'Standard' }
    it { subject.price.must_equal 24.0000 }
    it { subject.price_type.must_equal 48 }
    it { subject.price_type_desc.must_equal 'Perf Performance Package Web' }
    it { subject.rank.must_equal 1 }
    it { subject.zone_no.must_equal 33 }
  end
end
