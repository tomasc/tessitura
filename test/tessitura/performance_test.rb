require 'test_helper'

module Tessitura
  describe Performance do
    let(:sample_xml) do
      %(<?xml version="1.0" encoding="UTF-8"?>
        <DataSet xmlns="http://tessiturasoftware.com/">
          <diffgr:diffgram xmlns:msdata="urn:schemas-microsoft-com:xml-msdata" xmlns:diffgr="urn:schemas-microsoft-com:xml-diffgram-v1">
            <GetPerformanceDetailResult xmlns="">
              <Performance diffgr:id="Performance1" msdata:rowOrder="0">
                <composerln xml:space="preserve"></composerln>
                <description>description</description>
                <start_dt>2015-06-24T10:00:00-05:00</start_dt>
                <end_dt>2015-11-14T18:00:00-06:00</end_dt>
                <facility_desc>Theater</facility_desc>
                <facility_no>12</facility_no>
                <ga_ind>N</ga_ind>
                <inv_no>838</inv_no>
                <on_sale_ind>Y</on_sale_ind>
                <perf_dt>2015-11-14T19:30:00-06:00</perf_dt>
                <perf_status>1</perf_status>
                <perf_status_desc>On Sale</perf_status_desc>
                <perf_type_id>3</perf_type_id>
                <performance_type>Dance</performance_type>
                <print_ind>Y</print_ind>
                <prod_season_no>835</prod_season_no>
                <season_desc>Performance Season</season_desc>
                <season_no>13</season_no>
                <seat_ind>Y</seat_ind>
                <time_slot>1</time_slot>
                <time_slot_desc>Evening</time_slot_desc>
                <type>R</type>
                <zmap_no>13</zmap_no>
              </Performance>
            </GetPerformanceDetailResult>
          </diffgr:diffgram>
        </DataSet>)
    end

    subject { Performance.new(sample_xml) }

    it { subject.id.must_equal 'Performance1' }
    it { subject.description.must_equal 'description' }
    it { subject.start_dt.must_equal DateTime.parse('2015-06-24T10:00:00-05:00') }
    it { subject.end_dt.must_equal DateTime.parse('2015-11-14T18:00:00-06:00') }
    it { subject.perf_dt.must_equal DateTime.parse('2015-11-14T19:30:00-06:00') }
    it { subject.facility_desc.must_equal 'Theater' }
    it { subject.facility_no.must_equal 12 }
    it { subject.ga_ind.must_equal false }
    it { subject.inv_no.must_equal 838 }
    it { subject.on_sale_ind.must_equal true }
    it { subject.perf_status.must_equal 1 }
    it { subject.perf_status_desc.must_equal 'On Sale' }
    it { subject.perf_type_id.must_equal 3 }
    it { subject.performance_type.must_equal 'Dance' }
    it { subject.print_ind.must_equal true }
    it { subject.prod_season_no.must_equal 835 }
    it { subject.season_desc.must_equal 'Performance Season' }
    it { subject.season_no.must_equal 13 }
    it { subject.seat_ind.must_equal true }
    it { subject.time_slot.must_equal 1 }
    it { subject.time_slot_desc.must_equal 'Evening' }
    it { subject.type.must_equal 'R' }
    it { subject.zmap_no.must_equal 13 }
  end
end
