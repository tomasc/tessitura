require 'httparty'
require 'oga'

module Tessitura
  class ApiCall < Struct.new(:options)
    include HTTParty

    default_options.update(verify: false)

    def initialize(options = {})
      super(options)
      self.class.base_uri base_uri
    end

    # TODO: raise error when not found
    def performance(id)
      request_query = { 'iPerf_no' => id.to_s, 'iModeOfSale' => '10' }
      response = self.class.get(performance_detail_path, query: request_query)

      case response.code
      when 200 then Performance.new(response.body)
      else false
      end
    end

    private

    def base_uri
      options.fetch :base_uri
    end

    def performance_detail_path
      '/LiveAPI/Tessitura.asmx/GetPerformanceDetail'
    end
  end
end
