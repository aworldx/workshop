require 'nokogiri'

module GeoParser
  def self.parse_response(response)
    xml_doc = Nokogiri::XML(response)
    options = [:city, :country]

    options.reduce({}) do |acc, param|
      node = xml_doc.at_css("//#{param.to_s}")
      value = node ? node.text : ''

      acc.update(param => value)
    end
  end
end
