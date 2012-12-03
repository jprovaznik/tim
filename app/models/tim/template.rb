require "nokogiri"

module Tim
  class Template < Tim::Base
    include ActiveModel::Validations
    validates_with TemplateValidator

    has_many :base_images

    attr_accessible :xml
    attr_protected :id

    # Used in views to display the xml elements of this template
    def xml_elements
      parsed_xml.xpath("//template/*").to_xml
    end

    def os
      {
        :name    => parsed_xml.xpath("//template/os/name").text,
        :version => parsed_xml.xpath("//template/os/version").text,
        :arch    => parsed_xml.xpath("//template/os/arch").text
      }
    end

    private

    def parsed_xml
      @parsed_xml ||= ::Nokogiri::XML::Document.parse(xml)
    end
  end
end
