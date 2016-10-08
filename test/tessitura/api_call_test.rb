require 'test_helper'

module Tessitura
  describe ApiCall do
    let(:base_uri) { 'https://testapp.tessituranetworkramp.com' }
    let(:api_call) { ApiCall.new base_uri: base_uri }

    before { VCR.insert_cassette 'tessitura_api_call' }
    after { VCR.eject_cassette }

    describe 'performance' do
      let(:performance_id) { 1230 }
      subject { api_call.performance(performance_id) }

      it { subject.must_be_kind_of Tessitura::Performance }

      describe 'details' do
        it { subject.tessitura_id.must_equal performance_id }
      end

      describe '#all_prices' do
        it { subject.all_prices.count.must_equal 3 }
        it { subject.all_prices.map(&:class).uniq.must_equal [Tessitura::AllPrice] }
      end

      describe '#price_types' do
        it { subject.price_types.count.must_equal 3 }
        it { subject.price_types.map(&:class).uniq.must_equal [Tessitura::PriceType] }
      end
    end
  end
end
