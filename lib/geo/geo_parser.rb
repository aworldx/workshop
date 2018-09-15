require 'nokogiri'

module GeoParser
  def self.parse_response(response, params)
    xml_doc = Nokogiri::XML(response)

    params.split(',').reduce({}) do |acc, param|
      key = param.strip.downcase
      next if key.empty?

      node = xml_doc.at_css("//#{key}")
      value = node ? node.text : ''

      acc.update(key.to_sym => value)
    end
  end
end
